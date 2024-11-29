uint32_t add(uint32_t num1, uint32_t num2){                         
    return num1 + num2;                                           
}                                                                    
                                                                     
uint32_t subtract(uint32_t num1, uint32_t num2){                    
  return num1 - num2;                                           
}                                                                   
                                                                    
uint32_t multiply(uint32_t num1, int32_t num2){                     
   return num1 * num2;                                           
}                                                                   
                                                                    
uint32_t divide (uint32_t num1, uint32_t num2){                     
  if(num1 > 0){                                                  
	   return num1 / num2;                                        
	 }else{                                                        
	   num1 = -0;                                                 
	   return num1;                                               
	 }                                                             
}                                                                 
