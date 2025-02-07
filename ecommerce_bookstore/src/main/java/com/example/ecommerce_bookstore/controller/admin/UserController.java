package com.example.ecommerce_bookstore.controller.admin;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.domain.dto.RegisterUserDTO;
import com.example.ecommerce_bookstore.domain.dto.UpdateUserDTO;
import com.example.ecommerce_bookstore.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // View user detail page
    @GetMapping("/admin/users/detail/{id}")
    public String getDetailUserPage(@PathVariable("id") long id, Model model) {
        User user = this.userService.getById(id).get();
        model.addAttribute("user", user);
        return "admin/users/detail";
    }

    // View create user page
    @GetMapping("/admin/users/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("registerUserDTO", new RegisterUserDTO());
        return "admin/users/create";
    }

    // Create user
    @PostMapping("/admin/users/create")
    public String postCreateUser(@ModelAttribute("registerUserDTO") @Valid RegisterUserDTO registerUserDTO,
            BindingResult result,
            @RequestParam("fileImage") MultipartFile fileImage) throws IOException {
        if (result.hasErrors()) {
            return "admin/users/create";
        }
        this.userService.createUser(registerUserDTO, fileImage);
        return "redirect:/admin/users";
    }

    // View update user page
    @GetMapping("/admin/users/update/{id}")
    public String getUpdateUserPage(@PathVariable("id") long id, Model model) {
        User user = this.userService.getById(id).get();
        UpdateUserDTO newUser = this.userService.userToUpdateUserDto(user);
        model.addAttribute("updateUserDTO", newUser);
        model.addAttribute("avatar", newUser.getAvatar());
        model.addAttribute("district", user.getDistrict());
        model.addAttribute("province", user.getProvince());
        model.addAttribute("ward", user.getWard());
        return "admin/users/update";
    }

    // Update user
    @PostMapping("/admin/users/update")
    public String postUpdateUser(@ModelAttribute("updateUserDTO") @Valid UpdateUserDTO updateUserDTO,
            BindingResult result,
            @RequestParam("fileImage") MultipartFile fileImage, Model model) throws IOException {
        if (result.hasErrors()) {
            User user = this.userService.getByEmail(updateUserDTO.getEmail()).get();
            model.addAttribute("district", user.getDistrict());
            model.addAttribute("province", user.getProvince());
            model.addAttribute("ward", user.getWard());
            model.addAttribute("avatar", user.getAvatar());
            return "admin/users/update";
        }
        User user = this.userService.updateUserDtoToUser(updateUserDTO);
        this.userService.updateUser(user, fileImage);
        return "redirect:/admin/users";
    }

    // View delete user page
    @GetMapping("/admin/users/delete/{id}")
    public String getDeleteUserPage(@PathVariable("id") long id, Model model) {
        User user = this.userService.getById(id).get();
        model.addAttribute("modelUser", user);
        return "admin/users/delete";
    }

    // Delete user
    @PostMapping("/admin/users/delete")
    public String postDeleteUser(@ModelAttribute("modelUser") User modelUser) throws IOException {
        this.userService.deleteUser(modelUser);
        return "redirect:/admin/users";
    }

}
