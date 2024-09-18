package com.example.ecommerce_bookstore.controller.admin;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.domain.dto.UserDTO;
import com.example.ecommerce_bookstore.service.ImageService;
import com.example.ecommerce_bookstore.service.UserService;

@Controller
public class UserController {
    private final UserService userService;
    private final ImageService imageService;

    public UserController(UserService userService, ImageService imageService) {
        this.userService = userService;
        this.imageService = imageService;
    }

    // View user detail
    @GetMapping("/admin/users/detail/{id}")
    public String getDetailUserPage(@PathVariable("id") long id, Model model) {
        User user = this.userService.getUserById(id).get();
        model.addAttribute("user", user);
        return "admin/users/detail";
    }

    // View create user page
    @GetMapping("/admin/users/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "admin/users/create";
    }

    // Create user
    @PostMapping("/admin/users/create")
    public String postCreateUser(@ModelAttribute("userDTO") UserDTO userDTO,
            @RequestParam("fileImage") MultipartFile fileImage) throws IOException {
        String uploadDirectory = "src/main/webapp/resources/admin/images/avatar";
        String imageString = imageService.saveImageToStorage(uploadDirectory, fileImage);
        userDTO.setAvatar(imageString);
        User user = new User();
        user = this.userService.userDtoToUser(userDTO);
        user = this.userService.createUser(user);
        return "redirect:/admin/users";
    }

    // View update user page
    @GetMapping("/admin/users/update/{id}")
    public String getUpdateUserPage(@PathVariable("id") long id, Model model) {
        User user = this.userService.getUserById(id).get();
        model.addAttribute("modelUser", user);
        return "admin/users/update";
    }

    // @PostMapping("/admin/users/update")
    // public String postUpdateUser() {
    // return "redirect:/admin/users";
    // }

}
