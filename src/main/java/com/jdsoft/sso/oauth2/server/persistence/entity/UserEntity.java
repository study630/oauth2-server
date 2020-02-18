package com.jdsoft.sso.oauth2.server.persistence.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"regname"}),name = "k_user")
public class UserEntity extends BaseEntity {

    private static final long serialVersionUID = -5519234457588411587L;

//    @Id
//    //@GeneratedValue(strategy = GenerationType.IDENTITY)
//    @GeneratedValue(generator ="jpa-uuid")
//    private String id;
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private long id_9dsoft;

    @Column(nullable = false, columnDefinition = "VARCHAR(100)",name = "regname")
    private String username;

    @Column(nullable = false,name = "pwd")
    private String password;

    @Column(columnDefinition = "varchar(10)")
    private String pwdtype;

    /**
     * 多种登陆方式合并账号使用
     */
    private String accountOpenCode;
    private String nickname;
    private String email;
    private String mobile;
    private LocalDate birthday;
    private String region;
    private String address;
    private String sex;
    private LocalDateTime failureTime;
    private LocalDateTime lastlogintime;

    @ManyToMany(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
    @JoinTable(joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"), foreignKey = @ForeignKey(ConstraintMode.NO_CONSTRAINT), inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"), inverseForeignKey = @ForeignKey(ConstraintMode.NO_CONSTRAINT))
    List<RoleEntity> roles = new ArrayList<>();

    @ManyToMany(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinTable(joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"), foreignKey = @ForeignKey(ConstraintMode.NO_CONSTRAINT), inverseJoinColumns = @JoinColumn(name = "app_id", referencedColumnName = "id"), inverseForeignKey = @ForeignKey(ConstraintMode.NO_CONSTRAINT))
    List<OauthAppEntity> apps = new ArrayList<>();

//    public String getId() {
//        return id;
//    }
//
//    public void setId(String id) {
//        this.id = id;
//    }
//
//    public long getId_9dsoft() {
//        return id_9dsoft;
//    }
//
//    public void setId_9dsoft(long id_9dsoft) {
//        this.id_9dsoft = id_9dsoft;
//    }

    public String getPwdtype() {
        return pwdtype;
    }

    public void setPwdtype(String pwdtype) {
        this.pwdtype = pwdtype;
    }

    @Column(name = "failure_count", columnDefinition = "int default 0")
    private int failureCount;

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public LocalDateTime getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(LocalDateTime lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccountOpenCode() {
        return accountOpenCode;
    }

    public void setAccountOpenCode(String accountOpenCode) {
        this.accountOpenCode = accountOpenCode;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickName) {
        this.nickname = nickName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String gender) {
        this.sex = gender;
    }

    public LocalDateTime getFailureTime() {
        return failureTime;
    }

    public void setFailureTime(LocalDateTime failureTime) {
        this.failureTime = failureTime;
    }

    public int getFailureCount() {
        return failureCount;
    }

    public void setFailureCount(int failureCount) {
        this.failureCount = failureCount;
    }

    public List<RoleEntity> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleEntity> roles) {
        this.roles = roles;
    }

    public List<OauthAppEntity> getApps() {
        return apps;
    }

    public void setApps(List<OauthAppEntity> apps) {
        this.apps = apps;
    }
}
