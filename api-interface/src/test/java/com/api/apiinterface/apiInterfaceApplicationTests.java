package com.api.apiinterface;

import com.api.apiclientsdk.client.ApiClient;

import com.api.apiclientsdk.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * 测试类
 *

 */
@SpringBootTest
class apiInterfaceApplicationTests {

    @Resource
    private ApiClient apiClient;

    @Test
    void contextLoads() {
        String result = apiClient.getNameByGet("api");
        User user = new User();
        user.setUserName("作_者 【程序员_鱼皮】 https://space.bilibili.com/12890453/");
        String usernameByPost = apiClient.getUsernameByPost(user);
        System.out.println(result);
        System.out.println(usernameByPost);
    }

}
