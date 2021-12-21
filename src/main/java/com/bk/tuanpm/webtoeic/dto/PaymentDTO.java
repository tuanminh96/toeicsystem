package com.bk.tuanpm.webtoeic.dto;

public class PaymentDTO {
	private int vnp_Amount;
	private String vnp_Command;
	private String vnp_CreateDate;
	private String vnp_CurrCode;
	private String vnp_IpAddr;
	private String vnp_Locale;
	private String vnp_BankCode;
	private String vnp_OrderInfo;
	private String vnp_OrderType;
	private String vnp_ReturnUrl;
	private String vnp_TmnCode;
	private String vnp_TxnRef;
	private String vnp_Version;
	private String vnp_SecureHash;
	private int idUser;
	public int getVnp_Amount() {
		return vnp_Amount;
	}
	public void setVnp_Amount(int vnp_Amount) {
		this.vnp_Amount = vnp_Amount;
	}
	public String getVnp_Command() {
		return vnp_Command;
	}
	public void setVnp_Command(String vnp_Command) {
		this.vnp_Command = vnp_Command;
	}
	public String getVnp_CreateDate() {
		return vnp_CreateDate;
	}
	public void setVnp_CreateDate(String vnp_CreateDate) {
		this.vnp_CreateDate = vnp_CreateDate;
	}
	public String getVnp_CurrCode() {
		return vnp_CurrCode;
	}
	public void setVnp_CurrCode(String vnp_CurrCode) {
		this.vnp_CurrCode = vnp_CurrCode;
	}
	public String getVnp_IpAddr() {
		return vnp_IpAddr;
	}
	public void setVnp_IpAddr(String vnp_IpAddr) {
		this.vnp_IpAddr = vnp_IpAddr;
	}
	public String getVnp_Locale() {
		return vnp_Locale;
	}
	public void setVnp_Locale(String vnp_Locale) {
		this.vnp_Locale = vnp_Locale;
	}
	public String getVnp_OrderInfo() {
		return vnp_OrderInfo;
	}
	public void setVnp_OrderInfo(String vnp_OrderInfo) {
		this.vnp_OrderInfo = vnp_OrderInfo;
	}
	public String getVnp_OrderType() {
		return vnp_OrderType;
	}
	public void setVnp_OrderType(String vnp_OrderType) {
		this.vnp_OrderType = vnp_OrderType;
	}
	public String getVnp_ReturnUrl() {
		return vnp_ReturnUrl;
	}
	public void setVnp_ReturnUrl(String vnp_ReturnUrl) {
		this.vnp_ReturnUrl = vnp_ReturnUrl;
	}
	public String getVnp_TmnCode() {
		return vnp_TmnCode;
	}
	public void setVnp_TmnCode(String vnp_TmnCode) {
		this.vnp_TmnCode = vnp_TmnCode;
	}
	public String getVnp_TxnRef() {
		return vnp_TxnRef;
	}
	public void setVnp_TxnRef(String vnp_TxnRef) {
		this.vnp_TxnRef = vnp_TxnRef;
	}
	public String getVnp_Version() {
		return vnp_Version;
	}
	public void setVnp_Version(String vnp_Version) {
		this.vnp_Version = vnp_Version;
	}
	public String getVnp_SecureHash() {
		return vnp_SecureHash;
	}
	public void setVnp_SecureHash(String vnp_SecureHash) {
		this.vnp_SecureHash = vnp_SecureHash;
	}
	public String getVnp_BankCode() {
		return vnp_BankCode;
	}
	public void setVnp_BankCode(String vnp_BankCode) {
		this.vnp_BankCode = vnp_BankCode;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

}
