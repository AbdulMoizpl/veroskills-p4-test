import morepath

class App(morepath.App):
    pass

class Document(object):
    def __init__(self, id):
        self.id = id

@App.path(path='')
class Root(object):
    pass

@App.path(path='documents/{id}', model=Document)
def get_document(id):
    return Document(id)  # query for doc

@App.html(model=Root)
def hello_root(self, request):
    return '<a href="%s">Go to doc</a>' % request.link(Document('foo'))

@App.html(model=Document)
def hello_doc(self, request):
    return '<p>Hello document: %s!</p>' % self.id

if __name__ == '__main__':
    morepath.run(App())