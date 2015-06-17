#!/usr/bin/ruby
require 'net/ssh'
require 'net/sftp'
require 'fileutils'

class SiteSync
  
  attr_accessor :verbose, :server, :user, :passive
  
  def initialize(host, user, local_path, remote_path, key, options = {})
    @host = host
    @user = user
    @ignore = options[:ignore]
    @verbose = options[:verbose] || true
    @passive = options[:passive] || false
    @key = key
    @local_path = local_path
    @remote_path = remote_path
    @file_perm = options[:file_perm] || 0644
    @dir_perm = options[:dir_perm] || 0755
    push_dir @local_path, @remote_path
  end

  def push_dir(localpath, remotepath)
    log "Starting Sync"
    Net::SSH.start(@host, @user, :host_key => "ssh-rsa", :keys => [@key]) do |ssh|
      log "Connecting"
      ssh.sftp.connect do |sftp|
        log "Connected"
        Dir.glob(File.join(localpath, '**', '*')) do |f|
          f.gsub!("#{localpath}", '')
          local = File.join localpath, f
          remote = "#{remotepath}/#{f}".gsub(/\/+/, '/')
          if local !~ /\/export\/(flash\/(haxe|obj)|.build)/
            if File.directory?(local)
              unless remote_file_exists?(sftp, remote)
                log "Creating Remote Directory #{remote}..."
                sftp.mkdir! remote
              end
            elsif File.file?(local)
              if remote_file_exists?(sftp, remote)
                file = sftp.file.open(remote)
                filesize = file.stat.size
                file.close
                if File.stat(local).size != filesize
                  log "Pushed file #{remote}"
                  sftp.upload! local, remote
                end
              else
                log "Pushed file #{remote}"
                sftp.upload! local, remote
                sftp.setstat(remote, :permissions => @file_perm)
              end
            end
          end
        end
        log "Finished UP Sync"
        begin
          sftp.dir.glob(remotepath, '**') do |entry|
            f = entry.name
            f.gsub("#{localpath}", '')
            local = File.join localpath, f
            remote = "#{remotepath}/#{f}".gsub(/\/+/, '/')
            log remote
            if File.directory?(remote)
              unless File.directory?(local)
                sftp.rmdir!(remote)
                log "Removed directory #{remote}"
              end
            elsif File.file?(remote)
              unless File.exist?(local)
                sftp.remove(remote)
                log "Removed file #{remote}"
              end
            end
          end
        rescue Net::SFTP::StatusException => e
          raise unless e.code == 2
          next
        end
        
      end
    end
    
    log "Finished Sync"
  end
  
  private
  def remote_file_exists?(sftp, remote_path)
    begin
    sftp.stat!(remote_path) do |response|
      return true if response.ok?
    end
    rescue Net::SFTP::StatusException
      return false
    end
  end
  
  def log(msg)
    puts msg if @verbose
  end
    
end

sync = SiteSync.new 'ssh.phx.nearlyfreespeech.net', 'seifertim_hfmechanics', '_site', '/home/public', './.ssh/key'