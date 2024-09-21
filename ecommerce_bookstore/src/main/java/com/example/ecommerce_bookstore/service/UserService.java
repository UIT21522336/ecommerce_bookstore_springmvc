package com.example.ecommerce_bookstore.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.ecommerce_bookstore.domain.Role;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.domain.dto.UserDTO;
import com.example.ecommerce_bookstore.repository.RoleRepository;
import com.example.ecommerce_bookstore.repository.UserRepository;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ImageService imageService;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, ImageService imageService) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.imageService = imageService;
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

    public void createUser(UserDTO userDTO, MultipartFile fileImage) throws IOException {
        // save image to local directory
        String uploadDirectory = "src/main/webapp/resources/admin/images/avatar";
        String imageString = imageService.saveImageToStorage(uploadDirectory, fileImage);

        userDTO.setAvatar(imageString);
        User user = userDtoToUser(userDTO);
        user = this.userRepository.save(user);
    }

    public void updateUser(User modelUser, MultipartFile fileImage) throws IOException {
        // find user in dtb by id
        User user = getUserById(modelUser.getId()).get();

        if (modelUser.getFullName() != null) {
            user.setFullName(modelUser.getFullName());
        }
        if (modelUser.getGender() != null) {
            user.setGender(modelUser.getGender());
        }
        if (modelUser.getPhone() != null) {
            user.setPhone(modelUser.getPhone());
        }
        if (modelUser.getProvince() != null) {
            user.setProvince(modelUser.getProvince());
        }
        if (modelUser.getDistrict() != null) {
            user.setDistrict(modelUser.getDistrict());
        }
        if (modelUser.getWard() != null) {
            user.setWard(modelUser.getWard());
        }
        if (modelUser.getAddress() != null) {
            user.setAddress(modelUser.getAddress());
        }

        if (!fileImage.isEmpty()) {
            // delete old image from local directory
            this.imageService.deleteImage("src/main/webapp/resources/admin/images/avatar",
                    user.getAvatar());

            // add new image to local directory
            String uploadDirectory = "src/main/webapp/resources/admin/images/avatar";
            String imageString = imageService.saveImageToStorage(uploadDirectory,
                    fileImage);

            user.setAvatar(imageString);
        }
        user = this.userRepository.save(user);
    }

    public void deleteUser(User modelUser) throws IOException {
        // find user in dtb by id
        User user = getUserById(modelUser.getId()).get();

        // // delete avatar
        this.imageService.deleteImage("src/main/webapp/resources/admin/images/avatar",
        user.getAvatar());

        // delete user from dtb
        this.userRepository.delete(user);

    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public Optional<User> getUserById(long id) {
        return this.userRepository.findById(id);
    }

}
