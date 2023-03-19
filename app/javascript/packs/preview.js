if (document.URL.match(/new/)){
  document.addEventListener('DOMContentLoaded', () => {
    const createImageHTML = (blob) => {
      const imageElement = document.getElementById('new-image');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'new-img');
      blobImage.setAttribute('src', blob);
      if (document.querySelector('#new-image > img') == null) {
        imageElement.appendChild(blobImage);
      } else {
        const oldBlobImage = document.querySelector('#new-image > img');
        imageElement.replaceChild(blobImage, oldBlobImage)
      }
    };

    document.getElementById('post_image').addEventListener('change', (e) => {
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      } //画像変更用

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });
}