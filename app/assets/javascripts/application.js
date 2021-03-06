// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min
//= require_tree .
//= require chartkick
//= require Chart.bundle
//= require jquery
//= require moment
//= require fullcalendar

$(function () {
    // 画面遷移を検知
    $(document).on('turbolinks:load', function () {
        if ($('#calendar').length) {

            function Calendar() {
                return $('#calendar').fullCalendar({
                });
            }
            function clearCalendar() {
                $('#calendar').html('');
            }

            $(document).on('turbolinks:load', function () {
                Calendar();
            });
            $(document).on('turbolinks:before-cache', clearCalendar);

            //events: '/events.json', 以下に追加
            $('#calendar').fullCalendar({
                events: '/events.json',
                //カレンダー上部を年月で表示させる
                titleFormat: 'YYYY年 M月',
                //曜日を日本語表示
                dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
                //ボタンのレイアウト
                header: {
                    left: '',
                    center: 'title',
                    right: 'today prev,next'
                },
                //終了時刻がないイベントの表示間隔
                defaultTimedEventDuration: '03:00:00',
                buttonText: {
                    prev: '前',
                    next: '次',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日'
                },
                // Drag & Drop & Resize
                editable: true,
                //イベントの時間表示を２４時間に
                timeFormat: "HH:mm",
                //イベントの色を変える
                eventColor: '#87cefa',
                //イベントの文字色を変える
                eventTextColor: '#000000',
                eventRender: function(event, element) {
                    element.css("font-size", "0.8em");
                    element.css("padding", "5px");
                }
            });
        }
    });
});

$(document).on('turbolinks:load', function() {
  $(function(){
    $('.js-accordion-title').on('click', function () {
      /*クリックでコンテンツを開閉*/
      $(this).next().slideToggle(200);
      /*矢印の向きを変更*/
      $(this).toggleClass('open', 200);
    });
  });
});

// <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
// <script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.5.0/velocity.min.js"></script>
// <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.8.1/js/perfect-scrollbar.jquery.min.js"></script>
// <script type="text/javascript">
// // <script type="text/javascript">
// (function($) {
//     $(function () {
//
//         // サイドサブメニューアコーディオン
//         $('.sub-menu-head').on('click', function(){
//             var $subNav = $(this).next('.sub-menu-nav');
//             if ($subNav.is(':visible')) {
//                 $subNav.velocity('slideUp', {duration: 200});
//                 $(this).parent('li').removeClass('is-active');
//             }
//             else {
//                 $subNav.velocity('slideDown', {duration: 200});
//                 $(this).parent('li').addClass('is-active');
//             }
//             return false;
//         });
//
//         $('#nav-toggle').on('click', function() {
//             $('body').toggleClass('close');
//         });
//
//         $('.scroll').perfectScrollbar();
//     });
// })(jQuery);
// </script>
