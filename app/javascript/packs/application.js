// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import '@fortawesome/fontawesome-free/js/all';
import '../stylesheets/application.css';
import './preview';
import './script';
// import './jquery.jscroll.min.js';

Rails.start();
// Turbolinks.start()
ActiveStorage.start();

// 無限スクロールの処理
// window.addEventListener("DOMContentLoaded", function() {
//   console.log($('.jscroll'))
//   $('.jscroll').jscroll({ // 追加したdivのclass名と合わせる
//       contentSelector: '.jscroll',
//       nextSelector: 'a[rel~="next"]',  // 次ページリンクのセレクタ
//       autoTrigger: true,
//       loadingHtml: '読み込み中',
//     })
//     console.log("ssssss")
// })

$(document).ready(function () {
  $(window).on('scroll', function() {
    var scrollHeight = $(document).height();
    var scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
      $('.jscroll').jscroll({
        contentSelector: '.jscroll',
        nextSelector: 'a[rel~="next"]',  // 次ページリンクのセレクタ
        autoTrigger: true,
        loadingHtml: '読み込み中',
      });
    }
  });
})


// (function() {
//   $('.jscroll').jscroll({
//     nextSelector: 'span.next a'
//   });
//   console.log("kkkk")
// })();
// $(document).on('turbolinks:load', function() {
//   /*global $ */
//   console.log("ggggggg")
//   $('.jscroll-div').jscroll({ // 追加したdivのclass名と合わせる
//     contentSelector: '.jscroll',
//     nextSelector: '.next a',  // 次ページリンクのセレクタ
//     loadingHtml: '読み込み中',
//     padding: 10
//   })
// });


/*global $ */