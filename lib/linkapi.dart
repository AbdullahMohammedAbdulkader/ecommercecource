class AppLink {
 static const String server = "http://192.168.1.105/ecommerce" ;
 //static const String server = "http://192.168.100.24/ecommerce" ;

 static const String imagestatic = "http://192.168.1.105/ecommerce/upload" ;
 //static const String imagestatic = "http://192.168.100.24/ecommerce/upload" ;

 //=================================== Image ====================
 static const String imagecategories = "$imagestatic/categories" ;
 static const String imageitems = "$imagestatic/items" ;
 //==========================================================

 static const String test = "$server/test.php" ;

 //================================ auth ============================//

 static const String signUp     = "$server/auth/signup.php" ;
 static const String login      = "$server/auth/login.php" ;
 static const String verifyCode = "$server/auth/verifycode.php" ;
 static const String resend     = "$server/auth/resend.php";

//================================ forget password ============================//

 static const String checkEmail               = "$server/forgetpassword/checkemail.php" ;
 static const String verifyCodeforgetpassword = "$server/forgetpassword/verifycode.php" ;
 static const String resetPassword            = "$server/forgetpassword/resetpassword.php" ;

 //============================= Home =======================================//

 static const String homepage = "$server/home.php" ;

//============================ items =========================================//
 static const String items = "$server/items/items.php" ;
 static const String searchItems = "$server/items/search.php" ;

 //=========================== favorite ========================================//
 static const String favoriteAdd    = "$server/favorite/add.php" ;
 static const String favoriteRemove = "$server/favorite/remove.php" ;
 static const String favoriteView   = "$server/favorite/view.php" ;
 static const String favoriteDelete = "$server/favorite/deletefavorite.php" ;


 //============================= cart =========================================//

 static const String cartView          = "$server/cart/view.php" ;
 static const String cartAdd           = "$server/cart/add.php" ;
 static const String cartDelete        = "$server/cart/delete.php" ;
 static const String cartgetcountitems = "$server/cart/getcountitems.php" ;

 //============================= address =========================================//

 static const String addressView          = "$server/address/view.php" ;
 static const String addressAdd           = "$server/address/add.php" ;
 static const String addressDelete        = "$server/address/delete.php" ;
 static const String addressEdit          = "$server/address/edit.php" ;

 //============================ Coupon ===========================================//

 static const String CheckCoupon = "$server/coupon/checkcoupon.php" ;

//============================ CheckOut ===========================================//

static const String checkOut = "$server/orders/checkout.php" ;
static const String pendingOrders = "$server/orders/pending.php" ;
static const String archiveOrders = "$server/orders/archive.php" ;



}