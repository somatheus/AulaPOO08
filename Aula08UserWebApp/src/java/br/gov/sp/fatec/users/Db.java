/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.sp.fatec.users;

import java.util.ArrayList;

/**
 *
 * @author guih_
 */
public class Db {
    
    private static ArrayList<User> users;
    
    public static ArrayList<User> getUsers(){
        if(users == null){
            users = new ArrayList<>();
            User admin = new User();
            admin.setName("Administrador do Sistema");
            admin.setEmail("admin@admin.com");
            admin.setSenha("123456");
            users.add(admin);
            
             User user = new User();
            user.setName("Guilherme");
            user.setEmail("gui@gui.com");
            user.setSenha("123123");
            users.add(user);
            
            
        }
        
        return users;
    }
}
