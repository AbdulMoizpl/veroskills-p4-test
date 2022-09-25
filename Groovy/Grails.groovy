package grails.compiler

import grails.persistence.Entity
import org.codehaus.groovy.control.MultipleCompilationErrorsException
import spock.lang.Specification

class GrailsCompileStaticCompilationErrorsSpec extends Specification {

    @Issue('GRAILS-11056')

