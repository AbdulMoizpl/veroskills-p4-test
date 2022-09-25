package org.hibernate.tool.ant.AntHibernateTool;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.type.SqlTypes;
import org.hibernate.usertype.UserType;
/*
 * Just used for testing classpath loading for ant tasks!
 * Do not use as basis for your own usertypes!
 *
 * Created on 25-Feb-2005
 *
 */
public class AnyKindOfUserType implements UserType<Integer> {

	public int[] sqlTypes() {
		return new int[] { Types.INTEGER };
	}

	public Class<Integer> returnedClass() {
		return Integer.class;
	}

	public boolean equals(Integer x, Integer y) throws HibernateException {
		return x.equals(y);
	}

	public int hashCode(Integer x) throws HibernateException {
		return x.hashCode();
	}

	public void nullSafeSet(PreparedStatement st, Integer value, int index, SharedSessionContractImplementor session)
			throws HibernateException, SQLException {
		st.setInt(index, ( (Integer)value).intValue() );

	}

	public Integer deepCopy(Integer value) throws HibernateException {
		return Integer.valueOf( ( (Integer)value).intValue() );
	}
	public Integer assemble(Serializable cached, Object owner)
	throws HibernateException {
		return (Integer)cached;
	}

	public Serializable disassemble(Integer value) throws HibernateException {
		return (Serializable) value;
	}

	public Integer replace(Integer original, Integer target, Object owner)
	throws HibernateException {
		return original;
	}

	public boolean isMutable() {
		return false;
	}

	@Override
	public Integer nullSafeGet(ResultSet rs, int position, SharedSessionContractImplementor session, Object owner)
			throws SQLException {
		return Integer.valueOf(rs.getInt(position) );
	}

	@Override
	public int getSqlType() {
		return SqlTypes.BIGINT;
	}

}