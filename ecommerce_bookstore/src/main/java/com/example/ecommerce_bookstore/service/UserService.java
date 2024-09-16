package com.example.ecommerce_bookstore.service;

import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.domain.dto.UserDTO;
import com.example.ecommerce_bookstore.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User userDtoToUser(UserDTO userDTO) {
        User user = new User();
        user.setFullName(userDTO.getFirstName() + " " + userDTO.getLastName());
        user.setEmail(userDTO.getEmail());
        user.setPhone(userDTO.getPhone());
        user.setAvatar(userDTO.getAvatar());
        user.setAddress(userDTO.getAddress() + ", ward " + userDTO.getWard() + ", district " + userDTO.getDistrict()
                + ", " + userDTO.getProvince());
        user.setGender(userDTO.getGender());
        return user;
    }

    public User createUser(User user) {
        return this.userRepository.save(user);
    }
}
