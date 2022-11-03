
1、血的教训。注册servlet的时候，别名至少要有两层，比如：/servlet/InsertUser
   因为，如果只有一层，那么在Filter过滤时，当前路径就是网站路径。任何servlet的路径都是 /网站名/
   导致equals条件，全部都满足。