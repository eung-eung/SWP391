/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.user;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/**
 *
 * @author boyvi
 */
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserDTO {
    private int userID;
    private String wardID;
    private int roleID;
    private String email;
    private String phone;
    private Date yob;
    private String address;
    private String avatarUrl;
    private String username;
}
