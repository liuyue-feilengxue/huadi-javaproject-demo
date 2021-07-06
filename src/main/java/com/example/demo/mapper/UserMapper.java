package com.example.demo.mapper;

import com.example.demo.entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

//数据访问层
@Mapper
public interface UserMapper {

    public User findByUserName(String username);

    public void createUser(User user);

    public User findByNameAndPas(User user);

    @Update("update user " +
            "set password=#{password},nick_name=#{nickName} ,phone=#{phone}" +
            "where id=#{id}")
    public void updateUser(User user);

    @Delete("delete from user where id=#{id}")
    public void deleteUser(int id);

    @Select("select * from user")
    public List<User> findAll();

    @Select("select count(*) from user ")
    int count();

    @Select("select * from user where id=#{id}")
    public User findById(int id);
}
