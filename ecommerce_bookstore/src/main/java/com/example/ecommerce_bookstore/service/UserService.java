package com.example.ecommerce_bookstore.service;

import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.Role;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.domain.dto.UserDTO;
import com.example.ecommerce_bookstore.repository.RoleRepository;
import com.example.ecommerce_bookstore.repository.UserRepository;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public User userDtoToUser(UserDTO userDTO) {
        User user = new User();
        user.setFullName(userDTO.getFirstName() + " " + userDTO.getLastName());
        user.setEmail(userDTO.getEmail());
        user.setPhone(userDTO.getPhone());
        user.setAvatar(userDTO.getAvatar());
        user.setAddress(userDTO.getAddress());
        user.setGender(userDTO.getGender());
        user.setProvince(userDTO.getProvince());
        user.setDistrict(userDTO.getDistrict());
        user.setWard(userDTO.getWard());
        Role role = new Role();
        role = this.roleRepository.findByName(userDTO.getRole());
        user.setRole(role);
        return user;
    }

    public User createUser(User user) {
        return this.userRepository.save(user);
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public Optional<User> getUserById(long id) {
        return this.userRepository.findById(id);
    }
}
