/**
 * @param num1 {16 bit integer}
 * @param num2 {16 bit integer}
 * @returns {16 bit integer} num1 + num2
**/
uint16_t add(uint16_t num1, uint16_t num2){
     return num1 + num2;
}

uint16_t subtract (uint16_t num1, uint16_t num2){
     return num1 + num2;
}

/**
* @param num1 {16 bit integer}
* @param num2 {16 bit integer}
* @returns {16 bit integer} num1 - num2
**/
uint16_t multiply (uint16_t num1, uint16_t num2){
     return num1 * num2;
}

/**
* @param num1 {16 bit integer}
* @param num2 {16 bit integer}
* @returns {16 bit integer} num1 / num2 if num1 > 0 otherwise it returns -1
**/
uint16_t divide (uint16_t num1, uint16_t num2){
     if(num1 > 0){
          return num1 / num2;
     }else{
          return -1;
     }
}
