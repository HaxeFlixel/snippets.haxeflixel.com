function makePattern()
{

  var checkSize = 32;
  var demoWidth = 320;
  var demoHeight = 240;

  var pattern = document.createElement('canvas');
  pattern.width = checkSize*2;
  pattern.height = checkSize*2;
  var pctx = pattern.getContext('2d');

  pctx.fillStyle = "rgb(60,60,60)";
  pctx.fillRect(0,0,checkSize*2, checkSize*2);
  pctx.fillStyle = "rgb(135, 135, 135)";
  pctx.fillRect(0,0,checkSize,checkSize);
  pctx.fillRect(checkSize,checkSize,checkSize,checkSize);

  $('object.demo').each(function(  ) {

    demoWidth = $(this).width();
    demoHeight = $(this).height();

    var can = $('<canvas width="' + demoWidth +  '" height="' + demoHeight +  '" class="demo-back">')[0];
    var ctx = can.getContext('2d');

    var p = ctx.createPattern(pattern, "repeat");
    ctx.rect(0,0,demoWidth,demoHeight);
    ctx.fillStyle = p;
    ctx.fill();

    $(this).before(can);

  });

}
$(function() {

    $('#side-menu').metisMenu();

});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
    $(window).bind("load resize", function() {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height-60) + "px");
        }
    });

    var url = window.location;
    var element = $('ul.nav a').filter(function() {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).addClass('active').parent().parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }

});

$(document).ready(function() {

  sh_highlightDocument();

  makePattern();

  $('[data-toggle="tooltip"]').tooltip();

  $('div.source-body').on('show.bs.collapse', function () {
    $(this).parent('div').find('.source-chevron').addClass('fa-rotate-90');
  });

  $('div.source-body').on('hidden.bs.collapse', function () {
    $(this).parent('div').find('.source-chevron').removeClass('fa-rotate-90');
  });

});
