package com.example.mapper;

import com.example.domain.AttachVO;
import com.example.domain.ProfilePicVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProfilePicMapper {
    ProfilePicVO getProfilePic(String id);
    ProfilePicVO setProfilePic(String id, ProfilePicVO profilePicVO);

}
