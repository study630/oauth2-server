package com.revengemission.sso.oauth2.server;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptTest {
    /**
     * Bcrypt就是一款加密工具，可以比较方便地实现数据的加密工作。你也可以简单理解为它内部自己实现了随机加盐处理
     * 例如，我们使用MD5加密，每次加密后的密文其实都是一样的，这样就方便了MD5通过撞库的方式进行破解。
     * @param args
     */
    public static void main(String[] args) {
        //用户密码
        String password = "123456";
        //密码加密
        BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
        String newPassword = passwordEncoder.encode(password);//加密
        System.out.println("加密密码为："+newPassword);
        //对比这两个密码是否是同一个密码
        // true 两个密码一致 false反之
        boolean matches = passwordEncoder.matches(password, newPassword);
    }
}
