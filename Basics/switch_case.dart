/* Kinda like if...else statements 
but with a twist */

//Compares value of the given expression to other 'cases'
void main(){
  var grade = 'L';
  switch(grade){
    //Must specify a break or it will automatically go to the next case
    //Since breaks can only be used in loops, this also counts as a loop.
      case "A": {  print("Excellent"); } 
      break; 
     
      case "B": {  print("Good"); } 
      break; 
     
      case "C": {  print("Fair"); } 
      break; 
     
      case "D": {  print("Poor"); } 
      break; 

      default: { print("Invalid choice"); } //If it doesn't match any of the constants 
      break; 
  }
}