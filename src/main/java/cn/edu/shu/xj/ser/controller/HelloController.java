package cn.edu.shu.xj.ser.controller;


import cn.edu.shu.xj.ser.entity.Admin;
import cn.edu.shu.xj.ser.entity.Student;

import cn.edu.shu.xj.ser.service.AdminService;
import cn.edu.shu.xj.ser.service.StudentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "测试接口")
@RestController
public class HelloController {

    @Autowired

    StudentService studentService;

    @ApiOperation(value = "查询学生")
    @GetMapping("/query")
    public Student queryStudent(Integer sid){
        Student oneStudent = studentService.findOneStudent(sid);
        return oneStudent;
    }

    AdminService adminService;

    @ApiOperation(value = "查询管理员")
    @GetMapping("/query2")
    public Admin queryAdmin(Integer aid){
        Admin oneAdmin = adminService.findOneAdmin(aid);
        return oneAdmin;
    }
}
