// function makePattern() {

//   var checkSize = 32;
//   var demoWidth = 320;
//   var demoHeight = 240;

//   var pattern = document.createElement('canvas');
//   pattern.width = checkSize * 2;
//   pattern.height = checkSize * 2;
//   var pctx = pattern.getContext('2d');

//   pctx.fillStyle = "rgb(60,60,60)";
//   pctx.fillRect(0, 0, checkSize * 2, checkSize * 2);
//   pctx.fillStyle = "rgb(135, 135, 135)";
//   pctx.fillRect(0, 0, checkSize, checkSize);
//   pctx.fillRect(checkSize, checkSize, checkSize, checkSize);

//   var demos = document.querySelectorAll('object.demo');

//   for (var demo of demos) {

//     demoWidth = demo.width();
//     demoHeight = demo.height();

//     var can = $('<canvas width="' + demoWidth + '" height="' + demoHeight + '" class="demo-back">')[0];
//     var ctx = can.getContext('2d');

//     var p = ctx.createPattern(pattern, "repeat");
//     ctx.rect(0, 0, demoWidth, demoHeight);
//     ctx.fillStyle = p;
//     ctx.fill();

//     demo.before(can);

//   }

// }

document.addEventListener("DOMContentLoaded", function (event) {

  // var url = window.location;
  // var element = $('ul.nav a').filter(function() {
  //     return this.href == url || url.href.indexOf(this.href) == 0;
  // }).addClass('active').parent().parent().addClass('in').parent();
  // if (element.is('li')) {
  //     element.addClass('active');
  // }

  //makePattern();

  var tooltips = document.querySelectorAll('[data-toggle="tooltip"]');

  for (var tooltip of tooltips) {
    tooltip.tooltip();
  }

  // $('div.source-body').on('show.bs.collapse', function () {
  //   $(this).parent('div').find('.source-chevron').addClass('fa-rotate-90');
  // });

  // $('div.source-body').on('hidden.bs.collapse', function () {
  //   $(this).parent('div').find('.source-chevron').removeClass('fa-rotate-90');
  // });

});
