
package com.blackolive.app.domain.login;
import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthVO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8224526636637431755L;
	
	private String username;
	private String authority;
	
}
