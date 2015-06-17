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

$(document).ready(function() {

  sh_highlightDocument();
  
  makePattern();
  
  $('[data-toggle="tooltip"]').tooltip();
  
  $('div.source-body').on('show.bs.collapse', function () {
    $(this).parent('div').find('.icon-chevron-right').removeClass('icon-chevron-right').addClass('icon-chevron-down');
  });
  
  
  $('div.source-body').on('hidden.bs.collapse', function () {
    $(this).parent('div').find('.icon-chevron-down').removeClass('icon-chevron-down').addClass('icon-chevron-right');
  });
  
});


  

