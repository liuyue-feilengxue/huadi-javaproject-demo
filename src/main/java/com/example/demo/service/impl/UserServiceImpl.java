package com.example.demo.service.impl;

import com.example.demo.entity.User;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
//这里标红也问题不大。
    private UserMapper userMapper;
    @Override
    public User findByUserName(String username) {
        return userMapper.findByUserName(username);
    }

    @Override
    public void createUser(User user) {
        userMapper.createUser(user);
    }

    @Override
    public User findByNameAndPas(User user) {
        return userMapper.findByNameAndPas(user);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userMapper.deleteUser(id);
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }


    //int currentPage 当前页码，int pageSize 每页数据个数
    @Override
    public List<User> findByPage(int currentPage,int pageSize) {
        //使用分页插件
        PageHelper.startPage(currentPage,pageSize);
        return  userMapper.findAll();
    }

    @Override
    public int count() {
        return userMapper.count();
    }

    @Override
    public User findById(int id) {
        return userMapper.findById(id);
    }

}
