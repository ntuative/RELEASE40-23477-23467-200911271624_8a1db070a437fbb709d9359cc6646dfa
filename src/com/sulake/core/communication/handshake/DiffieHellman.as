package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1450:BigInteger;
      
      private var var_879:BigInteger;
      
      private var var_1967:BigInteger;
      
      private var var_1449:BigInteger;
      
      private var var_1968:BigInteger;
      
      private var var_1816:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1450 = param1;
         var_1967 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1968.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1449 = new BigInteger();
         var_1449.fromRadix(param1,param2);
         var_1968 = var_1449.modPow(var_879,var_1450);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1816.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_879 = new BigInteger();
         var_879.fromRadix(param1,param2);
         var_1816 = var_1967.modPow(var_879,var_1450);
         return true;
      }
   }
}
