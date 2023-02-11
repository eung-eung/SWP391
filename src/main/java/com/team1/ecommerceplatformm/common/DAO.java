/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.team1.ecommerceplatformm.common;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

/**
 *
 * @author boyvi
 */
public interface DAO<T> {
 
    List<T> getAll() throws SQLException;
 
    T get(int id) throws SQLException;
 
    void save(T t) throws SQLException;
 
    void update(T t) throws SQLException;
 
    void delete(T t) throws SQLException;

}
