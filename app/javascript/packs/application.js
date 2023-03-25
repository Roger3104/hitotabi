// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "jquery";
//import "popper.js";
//import "bootstrap";
import "../stylesheets/application";
import '@fortawesome/fontawesome-free/js/all';
import '../stylesheets/application.css';
import './preview';
import './script';
import './scroll.js';
// import './jquery.jscroll.min.js';

Rails.start();
// Turbolinks.start()
ActiveStorage.start();


// ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
// 無限スクロールの処理
/*global $ */
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

// ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

//アコーディオンをクリックした時の動作
$('.category-name').on('click', function() {//タイトル要素をクリックしたら
  var findElm = $(this).next(".box");//直後のアコーディオンを行うエリアを取得し
  $(findElm).slideToggle();//アコーディオンの上下動作

  if($(this).hasClass('close')){//タイトル要素にクラス名closeがあれば
    $(this).removeClass('close');//クラス名を除去し
  }else{//それ以外は
    $(this).addClass('close');//クラス名closeを付与
  }
});

//ページが読み込まれた際にopenクラスをつけ、openがついていたら開く動作※不必要なら下記全て削除
$(window).on('load', function(){
  $('.accordion-area li:first-of-type section').addClass("open"); //accordion-areaのはじめのliにあるsectionにopenクラスを追加
  $(".open").each(function(index, element){ //openクラスを取得
    var Title =$(element).children('.category-name'); //openクラスの子要素のtitleクラスを取得
    $(Title).addClass('close');       //タイトルにクラス名closeを付与し
    var Box =$(element).children('.box'); //openクラスの子要素boxクラスを取得
    $(Box).slideDown(500);          //アコーディオンを開く
  });
});

