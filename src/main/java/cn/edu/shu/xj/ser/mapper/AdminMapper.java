package cn.edu.shu.xj.ser.mapper;


import cn.edu.shu.xj.ser.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface AdminMapper {

    /**
     * @param aid
     * @return
     */
    @Select("select * from admin_info where admin_id=#{aid}")
    Admin findOneAdmin(@Param("aid") Integer aid);
}
