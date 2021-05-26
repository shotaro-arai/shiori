document.addEventListener('DOMContentLoaded', ()=>{
  if(document.getElementById('book_image')){
    // 空の(プレビュー表示予定の)div要素
    const image = document.getElementById("book-image");

    // 選択した画像を表示する関数
    const createImageHTML = (blob)=>{
      // div要素を生成
      const imageElement = document.createElement('div');
      // img要素を生成
      const blobImage = document.createElement('img');
      // div要素にsrc属性を追加
      blobImage.setAttribute('src', blob);
      blobImage.id = 'preview';
      // 親要素に引数の子要素を追加
      imageElement.appendChild(blobImage);
      image.appendChild(imageElement);
    };

    // 画像が添付されたらイベント発火
    document.getElementById("book_image").addEventListener('change',(e)=>{
      // 画像を変更しても前の画像のプレビューが残らないように処理
      const imageContent = document.getElementById('preview');

      if(imageContent){
        imageContent.remove();
      }

      // 画像を取得
      const file = e.target.files[0];
      // 画像URLを生成
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});