# Copyright (C) 2020 Kacper Sokol <k.sokol@bristol.ac.uk>
# License: AGPL-3.0

"""
A Sphinx extension implementing `infobox`, `exercise` and `swish` directives
used in the `online version <https://book.simply-logical.space/>`_ of the
Simply Logical book.
This extension is compatible with Jupyter Book.

See `this tutorial <https://www.sphinx-doc.org/en/master/development/tutorials/todo.html>`_
for more details on building custom directives.
`docutils`' nodes description is available
`here <https://docutils.sourceforge.io/docs/ref/doctree.html>`_, and their
documentation `here <http://code.nabla.net/doc/docutils/api/docutils/nodes/>`_.
"""

from docutils import nodes
from docutils.parsers.rst import Directive, directives

version = '0.1'


class infobox(nodes.Admonition, nodes.Element):
    pass


def visit_infobox_node(self, node):
    """
    Overwrites `Sphinx's HTML5 generator <https://github.com/sphinx-doc/sphinx/blob/3.x/sphinx/writers/html5.py#L53>`_.
    """
    self.body.append(self.starttag(
        node, 'div', CLASS=('admonition infobox')))


def depart_infobox_node(self, node):
    """
    Overwrites `Sphinx's HTML5 generator <https://github.com/sphinx-doc/sphinx/blob/3.x/sphinx/writers/html5.py#L53>`_.
    """
    self.body.append('</div>\n')


def visit_infobox_node_(self, node):
    self.visit_admonition(node)


def depart_infobox_node_(self, node):
    self.depart_admonition(node)


class Infobox(Directive):
    """
    `infobox` directive is of the form::
       .. infobox::
         :title: Infobox title (required)

         Infobox content.
    """
    required_arguments = 0
    optional_arguments = 0
    final_argument_whitespace = False
    has_content = True
    option_spec = {'title': directives.unchanged}

    def run(self):
        env = self.state.document.settings.env
        # the directive options
        options = self.options

        # get a custom target node for linking
        targetid = 'infobox-{:d}'.format(env.new_serialno('infobox'))
        targetnode = nodes.target('', '', ids=[targetid])

        infobox_content_node = infobox('\n'.join(self.content))

        # try to get the title
        infobox_title = options.get('title', None)
        if infobox_title is None:
            raise KeyError('infobox directive: the *title* option is missing.')

        infobox_title_node = nodes.title(infobox_title)
        # A hack to extract the processed title
        parsed_infobox_title = nodes.TextElement()
        self.state.nested_parse(
            [infobox_title], 0, parsed_infobox_title)
        assert len(parsed_infobox_title.children) == 1
        for child in parsed_infobox_title.children[0]:
            infobox_title_node += child

        infobox_content_node += infobox_title_node
        self.state.nested_parse(
            self.content, self.content_offset, infobox_content_node)

        return [targetnode, infobox_content_node]


class exercise(nodes.Admonition, nodes.Element):
    pass


def visit_exercise_node(self, node):
    """
    Overwrites `Sphinx's HTML5 generator <https://github.com/sphinx-doc/sphinx/blob/3.x/sphinx/writers/html5.py#L53>`_.
    """
    self.body.append(self.starttag(
        node, 'div', CLASS=('admonition exercise')))


def depart_exercise_node(self, node):
    """
    Overwrites `Sphinx's HTML5 generator <https://github.com/sphinx-doc/sphinx/blob/3.x/sphinx/writers/html5.py#L53>`_.
    """
    self.body.append('</div>\n')


def visit_exercise_node_(self, node):
    self.visit_admonition(node)


def depart_exercise_node_(self, node):
    self.depart_admonition(node)


class Exercise(Directive):
    """
    `exercise` directive is of the form::
       .. exercise:: 2.9

         Exercise content.
    """
    required_arguments = 1
    optional_arguments = 0
    final_argument_whitespace = False
    has_content = True
    option_spec = {}

    def run(self):
        env = self.state.document.settings.env

        exercise_id = env.new_serialno('exercise')

        # get a custom target node for linking
        targetid = 'exercise-{:d}'.format(exercise_id)
        targetnode = nodes.target('', '', ids=[targetid])

        exercise_content_node = exercise('\n'.join(self.content))

        # TODO: add global numbering and referencing -- <strong>Exercise [part].[seq]</strong>
        exercise_title = 'Exercise {:d}'.format(exercise_id)
        exercise_title_node = nodes.title(exercise_title, exercise_title)

        exercise_content_node += exercise_title_node
        self.state.nested_parse(
            self.content, self.content_offset, exercise_content_node)

        return [targetnode, exercise_content_node]


class SWISH(Directive):
    """
    `swish` directive is of the form::
       .. swish:: 1.2.3
          :inherit-id: 4.1.1 (optional)
          :source-text-start: 4.1.1-start (optional)
          :source-text-end: 4.1.1-end (optional)
    """
    required_arguments = 1
    optional_arguments = 0
    final_argument_whitespace = False
    has_content = False
    option_spec = {'inherit-id': directives.unchanged,
                   'source-text-start': directives.unchanged,
                   'source-text-end': directives.unchanged}

    def run(self):
        return []

def setup(app):
    app.add_node(infobox,
                 html=(visit_infobox_node, depart_infobox_node),
                 latex=(visit_infobox_node_, depart_infobox_node_),
                 text=(visit_infobox_node_, depart_infobox_node_))
    app.add_node(exercise,
                 html=(visit_exercise_node, depart_exercise_node),
                 latex=(visit_exercise_node_, depart_exercise_node_),
                 text=(visit_exercise_node_, depart_exercise_node_))

    app.add_directive('infobox', Infobox)
    app.add_directive('exercise', Exercise)
    app.add_directive('swish', SWISH)

    return {'version': version}
