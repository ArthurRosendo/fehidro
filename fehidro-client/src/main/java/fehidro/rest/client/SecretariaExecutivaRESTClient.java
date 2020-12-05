package fehidro.rest.client;

import java.util.List;

import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import fehidro.exception.CpfJaCadastradoException;
import fehidro.model.SecretariaExecutiva;

public class SecretariaExecutivaRESTClient extends BaseRESTClient implements RESTClientInterface<SecretariaExecutiva>{

	@Override
	public List<SecretariaExecutiva> findAll() {
		List<SecretariaExecutiva> usuarios = 
				ClientBuilder.newClient().
				target(REST_WEBSERVICE_URL + REST_SECRETARIA_URL).
				request(MediaType.APPLICATION_JSON).
				header(HttpHeaders.AUTHORIZATION, authToken).get().
				readEntity(new GenericType<List<SecretariaExecutiva>> () {});
		
		return usuarios;
	}

	@Override
	public SecretariaExecutiva find(Long id) {
		SecretariaExecutiva usuario = 
				ClientBuilder.newClient().
				target(REST_WEBSERVICE_URL + REST_SECRETARIA_URL + id).
				request(MediaType.APPLICATION_JSON).
				header(HttpHeaders.AUTHORIZATION, authToken).get().
				readEntity(SecretariaExecutiva.class);
		
		return usuario;
	}

	@Override
	public SecretariaExecutiva create(SecretariaExecutiva obj) throws CpfJaCadastradoException {
		Response response = ClientBuilder.newClient().
				target(REST_WEBSERVICE_URL + REST_SECRETARIA_URL).
				queryParam("usuario", obj).
				request(MediaType.APPLICATION_JSON).
				header(HttpHeaders.AUTHORIZATION, authToken).
				post(Entity.entity(obj, MediaType.APPLICATION_JSON));
		
		//CPF j� cadastrado
		if (response.getStatus() == 400) {
			throw new CpfJaCadastradoException("CPF j� cadastrado!");
		} else {
			SecretariaExecutiva usuario = 
					response.
					readEntity(SecretariaExecutiva.class);	
			return usuario;		
		}		
	}

	@Override
	public SecretariaExecutiva edit(SecretariaExecutiva obj) {
		SecretariaExecutiva usuario = 			
				ClientBuilder.newClient().
				target(REST_WEBSERVICE_URL + REST_SECRETARIA_URL).
				queryParam("usuario", obj).
				request(MediaType.APPLICATION_JSON).
				header(HttpHeaders.AUTHORIZATION, authToken).
				put(Entity.entity(obj, MediaType.APPLICATION_JSON)).
				readEntity(SecretariaExecutiva.class);	
		
		return usuario;
	}

	@Override
	public boolean delete(Long id) {
		return 	ClientBuilder.newClient().
				target(REST_WEBSERVICE_URL + REST_USUARIO_URL + id).
				request(MediaType.APPLICATION_JSON).
				header(HttpHeaders.AUTHORIZATION, authToken).
				delete().getStatus() 
				== Response.Status.OK.getStatusCode();
	}

}
