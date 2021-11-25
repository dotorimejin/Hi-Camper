package com.heal.dto;

import lombok.Data;

@Data
public class UpdateForm {

    private String memberId;
    private String memberPw;
    private String memberNick;
    private String memberMobile;
}
