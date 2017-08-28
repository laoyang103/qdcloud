package cn.gatherlife.wms.business.util;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;

import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.xson.common.object.XCO;

/**
 * Created by wuj on 2016/4/7.
 */
public class XcoMessageConverter extends AbstractHttpMessageConverter<XCO> {

    public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");

    private final Charset defaultCharset;

    public XcoMessageConverter() {
        this(DEFAULT_CHARSET);
    }

    public XcoMessageConverter(Charset defaultCharset) {
    	super(new MediaType("application", "xco", defaultCharset), MediaType.ALL);
        this.defaultCharset = defaultCharset;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }

    @Override
    protected XCO readInternal(Class<? extends XCO> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {

        Charset charset = getContentTypeCharset(inputMessage.getHeaders().getContentType());

        InputStreamReader reader = new InputStreamReader(inputMessage.getBody(), charset);
        StringBuilder out = new StringBuilder();
        char[] buffer = new char[4096];
        int bytesRead = -1;
        while ((bytesRead = reader.read(buffer)) != -1) {
           out.append(buffer, 0, bytesRead);
        }
        String xml = out.toString();
        xml = java.net.URLDecoder.decode(xml,"UTF-8");
        System.out.println("入参:"+xml);
        return   XCO.fromXML(xml);
    }

    @Override
    protected void writeInternal(XCO x, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        outputMessage.getHeaders().add("content-type", "text/xml;charset=utf-8");
        Charset charset = getContentTypeCharset(outputMessage.getHeaders().getContentType());
        Writer writer = new OutputStreamWriter( outputMessage.getBody(), charset);
        writer.write(x.toXMLString());
        writer.flush();
    }

    private Charset getContentTypeCharset(MediaType contentType) {
        if (contentType != null && contentType.getCharSet() != null) {
            return contentType.getCharSet();
        }
        else {
            return this.defaultCharset;
        }
    }
}
