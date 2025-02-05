package com.example.ecommerce_bookstore.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.example.ecommerce_bookstore.domain.Role;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.domain.dto.RegisterUserDTO;
import com.example.ecommerce_bookstore.domain.dto.UpdateUserDTO;
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
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, ImageService imageService,
            PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.imageService = imageService;
        this.passwordEncoder = passwordEncoder;

    }

    // mapper: UpdateUserDTO to User
    public User updateUserDtoToUser(UpdateUserDTO updateUserDTO) {
        User user = new User();
        user.setId(updateUserDTO.getId());
        user.setFullName(updateUserDTO.getFirstName() + " " + updateUserDTO.getLastName());
        user.setEmail(updateUserDTO.getEmail());
        user.setPhone(updateUserDTO.getPhone());
        user.setAvatar(updateUserDTO.getAvatar());
        user.setAddress(updateUserDTO.getAddress());
        user.setGender(updateUserDTO.getGender());
        user.setProvince(updateUserDTO.getProvince());
        user.setDistrict(updateUserDTO.getDistrict());
        user.setWard(updateUserDTO.getWard());
        user.setPassword(updateUserDTO.getPassword());
        Role role = new Role();
        role = this.roleRepository.findByName(updateUserDTO.getRole());
        user.setRole(role);
        return user;
    }

    // mapper: RegisterUserDTO to User
    public User registerUserDtoToUser(RegisterUserDTO registerUserDTO) {
        User user = new User();
        user.setFullName(registerUserDTO.getFirstName() + " " + registerUserDTO.getLastName());
        user.setEmail(registerUserDTO.getEmail());
        user.setPhone(registerUserDTO.getPhone());
        user.setAvatar(registerUserDTO.getAvatar());
        user.setAddress(registerUserDTO.getAddress());
        user.setGender(registerUserDTO.getGender());
        user.setProvince(registerUserDTO.getProvince());
        user.setDistrict(registerUserDTO.getDistrict());
        user.setWard(registerUserDTO.getWard());
        user.setPassword(passwordEncoder.encode(registerUserDTO.getPassword()));
        Role role = new Role();
        role = this.roleRepository.findByName(registerUserDTO.getRole());
        user.setRole(role);
        return user;
    }

    // mapper: User to UpdateUserDTO
    public UpdateUserDTO userToUpdateUserDto(User user) {
        UpdateUserDTO updateUserDTO = new UpdateUserDTO();
        updateUserDTO.setId(user.getId());
        updateUserDTO.setAvatar(user.getAvatar());
        updateUserDTO.setFirstName(user.getFullName().substring(0, user.getFullName().lastIndexOf(" ")));
        updateUserDTO.setLastName(user.getFullName().substring(user.getFullName().lastIndexOf(" ") + 1));
        updateUserDTO.setGender(user.getGender());
        updateUserDTO.setEmail(user.getEmail());
        updateUserDTO.setPhone(user.getPhone());
        updateUserDTO.setProvince(user.getProvince());
        updateUserDTO.setDistrict(user.getDistrict());
        updateUserDTO.setWard(user.getWard());
        updateUserDTO.setAddress(user.getAddress());
        updateUserDTO.setRole(user.getRole().getName());
        updateUserDTO.setPassword("");
        updateUserDTO.setConfirmPassword("");
        return updateUserDTO;
    }

    public void createUser(RegisterUserDTO registerUserDTO, MultipartFile fileImage) throws IOException {
        // save image to local directory
        String uploadDirectory = "src/main/webapp/resources/admin/images/avatar";
        String imageString = imageService.saveImageToStorage(uploadDirectory, fileImage);

        registerUserDTO.setAvatar(imageString);
        User user = registerUserDtoToUser(registerUserDTO);
        user = this.userRepository.save(user);
    }

    public void updateUser(User modelUser, MultipartFile fileImage) throws IOException {
        // find user in db by id
        User user = getById(modelUser.getId()).get();
        user.setAddress(modelUser.getAddress());
        user.setGender(modelUser.getGender());
        user.setFullName(modelUser.getFullName());
        user.setPhone(modelUser.getPhone());

        if (modelUser.getProvince() != null && modelUser.getDistrict() != null && modelUser.getWard() != null) {
            user.setProvince(modelUser.getProvince());
            user.setDistrict(modelUser.getDistrict());
            user.setWard(modelUser.getWard());
        }

        if (!modelUser.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(modelUser.getPassword()));
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
        User user = getById(modelUser.getId()).get();

        // // delete avatar
        this.imageService.deleteImage("src/main/webapp/resources/admin/images/avatar",
                user.getAvatar());

        // delete user from dtb
        this.userRepository.delete(user);

    }

    public List<User> getAll() {
        return this.userRepository.findAll();
    }

    public Optional<User> getById(long id) {
        return this.userRepository.findById(id);
    }

    public Optional<User> getByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public boolean checkExistUserByEmail(String email) {
        return this.userRepository.existsByEmail(email);
    }

}
