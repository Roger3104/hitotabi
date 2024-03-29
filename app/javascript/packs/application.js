// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "jquery";
// import "popper.js"; CDNに記載
//import "bootstrap"; CDNに記載
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

//アコーディオンパネルをクリックした時の動作
$(document).ready(function () {
  $('.category-name').on('click', function() {//タイトル要素をクリックしたら
    var findElm = $(this).next(".box");//直後のアコーディオンを行うエリアを取得し
    $(findElm).slideToggle();//アコーディオンの上下動作
    $('.category-name').not($(this)).siblings('.box').slideUp();
    $('.category-name').not($(this)).removeClass('close');
    if($(this).hasClass('close')){//タイトル要素にクラス名closeがあれば
      $(this).removeClass('close');//クラス名を除去し
    }else{//それ以外は
      $(this).addClass('close');//クラス名closeを付与
    }
  });
})

//--------home page image--------------//
$(function(){
  $('.home-image').hide().fadeIn(1000);
  $('.home-logo').hide().fadeIn(2000);
  $('.home-text-area').hide().fadeIn(4000);
  $('.about-logo').hide().fadeIn(2000);
  $('.about-text-area').hide().fadeIn(3000);
});
//----------------------//

//--------Flash message--------------//
//--------Flash message--------------//
$(function(){
  $('.flash').fadeOut(4000);  //3.5秒かけて消えていく
});

