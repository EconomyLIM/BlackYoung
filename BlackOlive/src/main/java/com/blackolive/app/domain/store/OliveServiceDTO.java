package com.blackolive.app.domain.store;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OliveServiceDTO {
	private String oliveServiceId;
	private String serviceName;
	private String serviceContent;
	private String serviceType;
}
