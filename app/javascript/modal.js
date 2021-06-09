document.addEventListener('DOMContentLoaded', ()=>{
  if(document.URL.match(/edit/)){
    const deleteUser = document.getElementById('delete-user');
    const modal = document.getElementById('modal');

    deleteUser.addEventListener('click', ()=>{
      const backGround = document.getElementById('modal-back-ground');
      const noBtn = document.getElementById('no-btn');
      modal.style.display='block';

      backGround.addEventListener('click',()=>{
        modal.style.display='none';
      });
      noBtn.addEventListener('click',()=>{
        modal.style.display='none'
      });
    });
  };
});