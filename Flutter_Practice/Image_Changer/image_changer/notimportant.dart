main(){
  Map mymap = {'assets': ['images/1.png', 'images/2.png', 'images/3.png', 'images/4.png', 'images/5.png', 'images/6.png']};
  print(mymap['assets'].length);
}


/*image_display(){//for setting 'display_this' according to jsonResult
  which_img += 1;
  if(which_img<jsonResult['assets'].length){
    display_this[0] = jsonResult['assets'][which_img];
  }else{
    which_img = -1;
  }
}*/