package fehidro.control;

import java.util.HashMap;

import fehidro.rest.client.AvaliacaoRESTClient;

public abstract class Relatorio {
	
	protected HashMap<Integer, ItemRelatorio> itensRelatorio;
	protected AvaliacaoRESTClient rest; //Ignore o warning de que n�o est� sendo usado
	
	public Relatorio()
	{
		rest = new AvaliacaoRESTClient();
	}
	
	public void gerar()
	{
		return null;
	}
	
	
}
