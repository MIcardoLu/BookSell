package cn.edu.shu.xj.ser.service;

import cn.edu.shu.xj.ser.entity.Admin;
import cn.edu.shu.xj.ser.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    @Autowired
    AdminMapper adminMapper;

    public Admin findOneAdmin(Integer aid) {
        return adminMapper.findOneAdmin(aid);
    }
}
