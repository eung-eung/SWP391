/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.common;

import com.team1.ecommerceplatformm.utils.DBUtil;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author boyvi
 */
public abstract class AbstractDAO<T> implements DAO<T> {
    
    protected Connection conn = DBUtil.getConnection();
    
//    public abstract ArrayList<T> getAll() throws SQLException;
//    public abstract boolean create() throws SQLException;
//    public abstract boolean update() throws SQLException;
//    public abstract boolean delete() throws SQLException;
}
