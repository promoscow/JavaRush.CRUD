package ru.xpendence.javarushtest.dao;

import ru.xpendence.javarushtest.model.User;

import java.util.List;

/**
 * Created by promoscow on 20.06.17.
 */
public interface UserDao {

    public void addUser(User user);

    public void updateUser(User user);

    public void removeUser(int id);

    public User getUserById(int id);

    public List<User> listUsers();

}
