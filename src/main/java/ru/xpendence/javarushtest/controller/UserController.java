package ru.xpendence.javarushtest.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.xpendence.javarushtest.model.User;
import ru.xpendence.javarushtest.service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by promoscow on 20.06.17.
 * Контроллер.
 */

@Controller
public class UserController {

    private static int id = 0;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
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
        return "redirect:/";
    }

    @RequestMapping("/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        logger.debug("UserController", "editUser");
        UserController.id = this.userService.getUserById(id).getId();
//        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
        return "redirect:/";
    }

    @RequestMapping("userdata{id}")
    public String userData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "redirect:/";
    }

    @RequestMapping(value = "/")
    public ModelAndView listOfUsers(@RequestParam(required = false) Integer page, @RequestParam(required = false) String userName) {
        System.out.println("ENTER LIST PAGING");
        System.out.println(userName);
        ModelAndView modelAndView = new ModelAndView("index");
        if (id != 0) {
            modelAndView.addObject("user", this.userService.getUserById(id));
            id = 0;
        } else {
            modelAndView.addObject("user", new User());
        }

        List<User> users = null;
        if (userName == null || userName.length() < 3) {
            users = this.userService.listUsers();
        } else {
            List<User> tempUsers = this.userService.listUsers();
            users = new ArrayList<User>();
            for (User tempUser : tempUsers) {
                if (tempUser.getName().toLowerCase().contains(userName.toLowerCase())) {
                    System.out.println("filter: " + tempUser);
                    users.add(tempUser);
                }
            }
        }
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
        }

        modelAndView.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        }
        return modelAndView;
    }
}
