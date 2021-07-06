package com.example.demo.service;

import com.example.demo.entity.User;

import java.util.List;

public interface UserService {
    public User findByUserName(String username);

    public void createUser(User user);

    public User findByNameAndPas(User user);

    public void updateUser(User user);

    public void deleteUser(int id);

    public List<User> findAll();

    public List<User> findByPage(int currentPage,int pageSize);

    public int count();

    public User findById(int id);
}
