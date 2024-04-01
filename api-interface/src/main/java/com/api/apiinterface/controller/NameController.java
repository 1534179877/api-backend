package com.api.apiinterface.controller;

import com.api.apiclientsdk.model.User;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 名称 API
 *

 */
@RestController
@RequestMapping("/name")
public class NameController {

    @GetMapping("/get")
    public String getNameByGet(String name, HttpServletRequest request) {
        System.out.println(request.getHeader("api"));
        return "GET 你的名字是" + name;
    }

    @PostMapping("/post")
    public String getNameByPost(@RequestParam String name) {
        return "POST 你的名字是" + name;
    }

    /**
     *
     * @param name
     * @param request
     * @return
     */
    @PostMapping("/queryLoversWx")
    public String queryLoversWx(@RequestBody String name, HttpServletRequest request){
        return  "QQWQEFDVZFDSAFFSA";
    }
    @PostMapping("/user")
    public String getUsernameByPost(@RequestBody User user, HttpServletRequest request) {

        // todo 调用次数 + 1 invokeCount
        String result = "POST 用户名字是" + user.getUserName();
        return result;
    }
}
