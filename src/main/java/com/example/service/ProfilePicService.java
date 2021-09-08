package com.example.service;

import com.example.domain.ProfilePicVO;
import com.example.mapper.AttachMapper;
import com.example.mapper.ProfilePicMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfilePicService {
    @Autowired
    private ProfilePicMapper profilePicMapper;

    public ProfilePicVO getProfilePic(String id){
        return profilePicMapper.getProfilePic(id);
    };
    public ProfilePicVO setProfilePic(String id, ProfilePicVO profilePicVO){
        return profilePicMapper.setProfilePic(id, profilePicVO);
    };
}
