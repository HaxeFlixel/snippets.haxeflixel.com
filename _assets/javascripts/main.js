function makePattern()
{

  var checkSize = 10;
  var demoWidth = 200;
  var demoHeight = 200;
  
  var pattern = document.createElement('canvas');
  pattern.width = checkSize*2;
  pattern.height = checkSize*2;
  var pctx = pattern.getContext('2d');

  pctx.fillStyle = "rgb(223, 240, 216)";
  pctx.fillRect(0,0,checkSize,checkSize);
  pctx.fillRect(checkSize,checkSize,checkSize,checkSize);
  
  $('object.demo').each(function(  ) {
  
    demoWidth = $(this).width();
    demoHeight = $(this).height();
    
    var can = $('<canvas width="' + demoWidth +  '" height="' + demoHeight +  '" class="demo-back">')[0];//.addClass();//document.createElement('canvas');
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
  
  
});