package ru.xpendence.javarushtest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.xpendence.javarushtest.model.User;
import ru.xpendence.javarushtest.service.UserService;

/**
 * Created by promoscow on 20.06.17.
 * Контроллер.
 */

@Controller
public class UserController {
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * Вывод списка пользователя.
     * <p>
     * Вывод всех моделей с атрибутом "users".
     *
     * @param model
     * @return остаёмся на странице
     */
    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers());
        return "users";
    }

    /**
     * Создание нового пользователя.
     * <p>
     * Если пользователя нет (id == 0), создаём нового. Если есть, обновляем того, что есть.
     *
     * @param user
     * @return редирект на страницу /users
     */
    @RequestMapping(value = "users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user) {
        if (user.getId() == 0) this.userService.addUser(user);
        else this.userService.updateUser(user);
        return "redirect:/";
    }

    /**
     * Удаление пользователя по ID.
     *
     * @param id
     * @return редирект на главную страницу
     */
    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        this.userService.removeUser(id);
        return "redirect:/users";
    }

    @RequestMapping("/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
        return "users";
    }

    @RequestMapping("userdata{id}")
    public String userData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "userdata";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("user", new User());
        return "index";
    }
}
