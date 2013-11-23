/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

/**
 *
 * @author Student
 */
public class CustomerRigistration {

    private String customer_id;
    private String name;
    private String telephone;
    private String email;
    private String gender;
    private String address;
    private String userName, password;
    private String role;

    public CustomerRigistration(String customer_id, String name, String telephone, String email, String gender, String address, String userName, String password) {
        this.customer_id = customer_id;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.gender = gender;
        this.address = address;
        this.userName = userName;
        this.password = password;
    }

    public CustomerRigistration() {
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
