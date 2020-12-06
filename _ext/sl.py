# Copyright (C) 2020 Kacper Sokol <k.sokol@bristol.ac.uk>
# License: AGPL-3.0
"""
A Sphinx extension implementing `infobox`, `exercise` and `swish` directives
used in the `online version <https://book.simply-logical.space/>`_ of the
Simply Logical book.
This extension is compatible with and intended for Jupyter Book.

See `this tutorial <https://www.sphinx-doc.org/en/master/development/tutorials/todo.html>`_
for more details on building custom directives.
`This <http://www.xavierdupre.fr/blog/2015-06-07_nojs.html>`_ blog post is also
useful.
`docutils`' nodes description is available
`here <https://docutils.sourceforge.io/docs/ref/doctree.html>`_, and their
documentation `here <http://code.nabla.net/doc/docutils/api/docutils/nodes/>`_.

There are two lists of 3rd party extension that can be used as a reference:
`awesome-sphinxdoc <https://github.com/yoloseem/awesome-sphinxdoc>`_ and
`sphinx extension survey <https://sphinxext-survey.readthedocs.io/>`_.
The `sphinxcontrib-proof <https://framagit.org/spalax/sphinxcontrib-proof/>`_
extension was particularly useful for developing the `exercise` directive.
"""

import os
import re
import sys

from docutils import nodes
from docutils.parsers.rst import Directive, directives

if sys.version_info >= (3, 0):
    unicode = str

VERSION = '0.1'


#### Infobox directive ########################################################


class infobox(nodes.Admonition, nodes.Element):
    """A `docutils` node holding Simply Logical infoboxes."""


def visit_infobox_node(self, node):
    """
    Builds an opening HTML tag for Simply Logical infoboxes.

    Overwrites `Sphinx's HTML5 generator <https://github.com/sphinx-doc/sphinx/blob/3.x/sphinx/writers/html5.py#L53>`_.
    """
    self.body.append(self.starttag(
        node, 'div', CLASS=('admonition infobox')))


def depart_infobox_node(self, node):
    """
    Builds a closing HTML tag for Simply Logical infoboxes.

    Overwrites `Sphinx's HTML5 generator <https://github.com/sphinx-doc/sphinx/blob/3.x/sphinx/writers/html5.py#L53>`_.
    """
    self.body.append('</div>\n')


def visit_infobox_node_(self, node):
    """
    Builds a prefix for embedding Simply Logical infoboxes in LaTeX and raw
    text.
    """
    raise NotImplemented
    self.visit_admonition(node)


def depart_infobox_node_(self, node):
    """
    Builds a postfix for embedding Simply Logical infoboxes in LaTeX and raw
    text.
    """
    raise NotImplemented
    self.depart_admonition(node)


class Infobox(Directive):
    """
    Defines the `infobox` directive for building Simply Logical infoboxes.

    The `infobox` directive is of the form::
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
        """Builds an infobox."""
        env = self.state.document.settings.env
        # get the directive options
        options = self.options

        # get a custom target node for linking with HTML ids
        targetid = 'infobox-{:d}'.format(env.new_serialno('infobox'))
        targetnode = nodes.target('', '', ids=[targetid])

        # build an infobox node
        infobox_content_node = infobox('\n'.join(self.content))

        # try to get the title -- it is a required argument
        infobox_title = options.get('title', None)
        if infobox_title is None:
            raise KeyError('infobox directive: the *title* option is missing.')
        infobox_title_node = nodes.title(infobox_title)

        # a hack to process the title, extract it and embed it in the title
        # node
        parsed_infobox_title = nodes.TextElement()
        self.state.nested_parse(
            [infobox_title], 0, parsed_infobox_title)
        assert len(parsed_infobox_title.children) == 1
        for child in parsed_infobox_title.children[0]:
            infobox_title_node += child

        # append the title node and process the content node
        infobox_content_node += infobox_title_node
        self.state.nested_parse(
            self.content, self.content_offset, infobox_content_node)

        return [targetnode, infobox_content_node]


#### Exercise directive #######################################################


class exercise(nodes.Admonition, nodes.Element):
    """A `docutils` node holding Simply Logical exercises."""


def visit_exercise_node(self, node):
    """
    Builds an opening HTML tag for Simply Logical exercises.

    Overwrites `Sphinx's HTML5 generator <https://github.com/sphinx-doc/sphinx/blob/3.x/sphinx/writers/html5.py#L53>`_.
    """
    self.body.append(self.starttag(
        node, 'div', CLASS=('admonition exercise')))


def depart_exercise_node(self, node):
    """
    Builds a closing HTML tag for Simply Logical exercises.

    Overwrites `Sphinx's HTML5 generator <https://github.com/sphinx-doc/sphinx/blob/3.x/sphinx/writers/html5.py#L53>`_.
    """
    self.body.append('</div>\n')


def visit_exercise_node_(self, node):
    """
    Builds a prefix for embedding Simply Logical exercises in LaTeX and raw
    text.
    """
    raise NotImplemented
    self.visit_admonition(node)


def depart_exercise_node_(self, node):
    """
    Builds a postfix for embedding Simply Logical exercises in LaTeX and raw
    text.
    """
    raise NotImplemented
    self.depart_admonition(node)


class exercise_title(nodes.title):
    """A `docutils` node holding the **title** of Simply Logical exercises."""


def visit_exercise_title_node(self, node):
    """
    Builds an opening HTML tag for the **title** node of the Simply Logical
    exercises.

    Overwrites Sphinx's HTML5
    `visit title <https://github.com/sphinx-doc/sphinx/blob/68cc0f7e94f360a2c62ebcb761f8096e04ebf07f/sphinx/writers/html5.py#L355>`_.

    Note: `self` is of a `writer` type.
    """
    assert self.builder.name != 'singlehtml', (
        'This function is not suitable for singlehtml builds -- '
        'see the URL in the docstring.')
    if not isinstance(node, exercise_title):
        raise RuntimeError('This function should only be used to process '
                           'an exercise title.')
    if not isinstance(node.parent, exercise):
        raise RuntimeError('This function should only be used to process '
                           'an exercise title that is embedded within an '
                           'exercise node.')
    assert len(node.parent['ids']) == 1, (
        'Exercise nodes need to be ided to be referenceable.')

    # self.body.append(self.starttag(node, 'p', CLASS=('admonition-title')))
    # alternative_visit_title(self, node)
    #
    self.visit_title(node)


def alternative_visit_title(self, node):
    """
    Provides an alternative implementation of Sphinx's HTML5 `add_fignumber`.

    See `here <https://github.com/sphinx-doc/sphinx/blob/68cc0f7e94f360a2c62ebcb761f8096e04ebf07f/sphinx/writers/html5.py#L280>`_ for more details.
    """
    std_domain = self.builder.env.domains['std']

    # get the figtype from the parent of this node since titles are not
    # enumerable
    figtype = std_domain.get_enumerable_node_type(node.parent)
    # get id the exercise node
    exercise_id = node.parent['ids'][0]

    if figtype is None:
        raise RuntimeError('The figtype was not found despite the '
                           'exercise_title node being used within an exercise '
                           'node.')

    assert figtype == 'exercise'
    # get the map of figure numbers for exercises for this document
    exercise_map = self.builder.fignumbers.get(figtype, {})

    # get figure number of the exercise node
    assert exercise_id in exercise_map
    exercise_number = exercise_map[exercise_id]

    # stringify the exercise id
    exercise_number_str = '.'.join(map(str, exercise_number))

    # format the exercise id
    prefix = self.builder.config.numfig_format.get(figtype)
    assert prefix is not None, 'exercise fignum format is not defined.'
    exercise_title = prefix % exercise_number_str

    # build the HTML structure
    self.body.append('<span class="caption-number">')
    self.body.append(exercise_title + ' ')
    self.body.append('</span>')


def depart_exercise_title_node(self, node):
    """
    Builds a closing HTML tag for the **title** node of the Simply Logical
    exercises.

    Overwrites `Sphinx's HTML5 generator <https://github.com/sphinx-doc/sphinx/blob/68cc0f7e94f360a2c62ebcb761f8096e04ebf07f/sphinx/writers/html5.py#L362>`_.
    """
    if (self.permalink_text and self.builder.add_permalinks
            and node.parent.hasattr('ids') and node.parent['ids']):
        self.add_permalink_ref(node.parent, 'Permalink to this exercise')
    else:
        raise RuntimeError('Could not add a permalink to an exercise box.')

    # self.body.append('</span>\n')
    #
    self.depart_title(node)


def visit_exercise_title_node_(self, node):
    """
    Builds a prefix for embedding the **title** of Simply Logical exercises in
    LaTeX and raw text.
    """
    raise NotImplemented


def depart_exercise_title_node_(self, node):
    """
    Builds a postfix for embedding the **title** of Simply Logical exercises in
    LaTeX and raw text.
    """
    raise NotImplemented


class Exercise(Directive):
    """
    Defines and processes the `exercise` directive, which is of the form::
       .. exercise:: ex:2.9

         Exercise content.

    `ex:2.9` is a label that can be referred to either with ``:ref:`ex:2.9```
    to get a hyperlink saying *exercise* (see the `exercise_title_getter`
    function), or with ``:numref:`ex:2.9``` to get a numbered reference based
    on the `numfig_format` for `exercise` (see the `set_exercise_numfig_format`
    function), which by default is defined as `Exercise %s`. To change this
    stub the `numfig_format.exercise` Sphinx setting variable can be set to the
    desired string formatter.

    Notes:
        `env.domaindata['std']` and `env.domains['std']` hold the reference
        catalogue.

        Giving an exercise node an id (via
        `exercise(content, ids=[unique_id])`) ensures that it gets a `numfig`
        assigned. When assigning a name via `self.add_name(node)`, this is done
        automatically. To get a nice id string we can use the
        `nodes.make_id(name)` function.

        Other useful arguments for creating a node are:

        * `ids=[id_]`,
        * `names=[label]`,
        * `label=label`,
        * `title=label`,
        * `docname=env.docname`.

        The inspiration for this directive -- in particular to make it
        referenceable and enumerable -- was taken from:

        * https://github.com/sphinx-doc/sphinx/blob/68cc0f7e94f360a2c62ebcb761f8096e04ebf07f/sphinx/directives/patches.py#L166
        * https://github.com/sphinx-doc/sphinx/blob/68cc0f7e94f360a2c62ebcb761f8096e04ebf07f/sphinx/directives/patches.py#L42

        and

        * https://docutils.sourceforge.io/docs/ref/doctree.html#names
        * https://docutils.sourceforge.io/docs/ref/rst/directives.html#common-options

        The latter two documents show the importance, universality and
        portability of the `name` option for a directive, and the former two
        show how to assign it on the fly if a directive was not given a `name`
        in the first place.
    """
    required_arguments = 1
    optional_arguments = 0
    final_argument_whitespace = False
    has_content = True
    option_spec = {}

    def run(self):
        """Builds an exercise box with a title."""
        env = self.state.document.settings.env

        # we do not assign an id to this node (despite it being a prerequisite
        # for assigning it a fignum) as this will happen automatically when
        # a name is assigned to this node
        exercise_content_node = exercise('\n'.join(self.content))

        # get the user-provided label of the exercise
        label = self.arguments[0]

        # since the label of the node was not given in the standard docutil
        # manner (via the optional `name` parameter), it needs to be manually
        # assigned to this instance of the exercise directive and processed,
        # i.e., it registers the label with the domain (standard `std` domain
        # in this case); it also checks whether the labels is not duplicated
        self.options['name'] = label
        self.add_name(exercise_content_node)
        # these steps ensure that the node created by this directive can be
        # referenced with `ref` and `numref`

        # build an empty exercise title, the fignum is injected when building
        # its HTML representation
        exercise_title_node = exercise_title()

        # add title to the exercise and process the content
        exercise_content_node += exercise_title_node
        self.state.nested_parse(
            self.content, self.content_offset, exercise_content_node)

        return [exercise_content_node]


def exercise_title_getter(node):
    """
    Defines the default calling name (accessed via :ref:`ex:1.1`) of an
    exercise node.
    """
    assert isinstance(node, exercise)
    return 'exercise'


def set_exercise_numfig_format(app, config):
    """
    Initialises the default `fignum_format` for the enumerated `exercise` node.

    This is needed as setting the default `numfig` format as follows::
        app.config.numfig_format.setdefault('exercise', 'Exercise %s')
    in the `setup(app)` function as shown `here
    <https://github.com/sphinx-doc/sphinx/blob/af62fa61e6cbd88d0798963211e73e5ba0d55e6d/tests/roots/test-add_enumerable_node/enumerable_node.py#L62>`_
    does not work.

    This function is hooked up to the `config-inited` Sphinx event.
    """
    numfig_format = {'exercise': 'Exercise %s'}

    # override the default numfig format with values in the config file
    numfig_format.update(config.numfig_format)
    config.numfig_format = numfig_format


#### SWISH directive ##########################################################


class swish_box(nodes.General, nodes.Element):
    """A `docutils` node holding Simply Logical swish boxes."""


def visit_swish_box_node(self, node):
    """Builds an opening HTML tag for Simply Logical swish boxes."""
    self.body.append(self.starttag(
        node, 'div', CLASS=('extract swish')))


def depart_swish_box_node(self, node):
    """Builds a closing HTML tag for Simply Logical swish boxes."""
    self.body.append('</div>\n')


def visit_swish_box_node_(self, node):
    """
    Builds a prefix for embedding Simply Logical swish boxes in LaTeX and raw
    text.
    """
    raise NotImplemented


def depart_swish_box_node_(self, node):
    """
    Builds a postfix for embedding Simply Logical swish boxes in LaTeX and raw
    text.
    """
    raise NotImplemented


class swish_code(nodes.literal_block, nodes.Element):
    """
    A `docutils` node holding the **code** embedded in the Simply Logical swish
    boxes.
    """


def visit_swish_code_node(self, node):
    """Builds an opening HTML tag for Simply Logical swish **code** boxes."""
    env = self.document.settings.env

    attributes = {}
    class_list = ['literal-block', 'source', 'swish']

    # get node id
    node_ids = node.get('ids', [])
    assert len(node_ids) == 1
    assert node_ids[0].startswith('swish.')
    swish_id = node_ids[0][6:]

    # composes the `inherit-id` HTML attribute if present
    inherit_id = node.attributes.get('inherit_id', None)
    if inherit_id is not None:
        iid = []
        for i in inherit_id.split(' '):
            iid.append('swish.{}'.format(i))
            # ensure that all of the inherited code blocks are also in this
            # document as otherwise the inheritance JavaScript will not work
            if env.sl_swish_code[i]['main_doc'] not in self.docnames:
                raise RuntimeError(
                    ('The code block *{}* placed in *{}* document inherits '
                     '*{}*, which is in a different document (*{}*). '
                     'Inheritance only works in a scope of a single '
                     'document.'.format(swish_id, self.docnames, i,
                                        env.sl_swish_code[i]['main_doc']))
                )
        attributes['inherit-id'] = ' '.join(iid)
        # if the code block inherits from another, it needs a special class
        class_list.append('inherit')

    # composes the `source-text-start` HTML attribute if present
    source_text_start = node.attributes.get('source_text_start', None)
    if source_text_start is not None:
        attributes['source-text-start'] = source_text_start

    # composes the `source-text-end` HTML attribute if present
    source_text_end = node.attributes.get('source_text_end', None)
    if source_text_end is not None:
        attributes['source-text-end'] = source_text_end

    # if the block is being inherited from, it needs a special class
    if swish_id in env.sl_swish_inherited:
        class_list.append('temp')

    # If either of the `source-text-start` or `source-text-end` attributes are
    # present, call a modified version of the `starttag` method/function that
    # does not prune whitespaces (such as newline characters) from the content
    # of the attributes.
    # This is achieved by modifying the call to `attval` (towards the end of
    # the implementation) with a substitute function (not removing
    # whitespace characters) that is also ported to this file.
    if 'source-text-start' in attributes or 'source-text-end' in attributes:
        # escape html such as <, >, ", etc. but **preserve new lines**
        tag = starttag(self, node, 'pre',
                       CLASS=' '.join(class_list),
                       **attributes)
    else:
        tag = self.starttag(node, 'pre',
                            CLASS=' '.join(class_list),
                            **attributes)
    self.body.append(tag)
    #self.visit_literal_block(node)


def starttag(self, node, tagname, suffix='\n', empty=False, **attributes):
    """
    Construct and return a start tag given a node (id & class attributes
    are extracted), tag name, and optional attributes.

    Ported from https://docutils.sourceforge.io/docutils/writers/_html_base.py
    with a tweaked `attval` call towards the end.
    """
    tagname = tagname.lower()
    prefix = []
    atts = {}
    ids = []
    for (name, value) in attributes.items():
        atts[name.lower()] = value
    classes = []
    languages = []
    # unify class arguments and move language specification
    for cls in node.get('classes', []) + atts.pop('class', '').split():
        if cls.startswith('language-'):
            languages.append(cls[9:])
        elif cls.strip() and cls not in classes:
            classes.append(cls)
    if languages:
        # attribute name is 'lang' in XHTML 1.0 but 'xml:lang' in 1.1
        atts[self.lang_attribute] = languages[0]
    if classes:
        atts['class'] = ' '.join(classes)
    assert 'id' not in atts
    ids.extend(node.get('ids', []))
    if 'ids' in atts:
        ids.extend(atts['ids'])
        del atts['ids']
    if ids:
        atts['id'] = ids[0]
        for id in ids[1:]:
            # Add empty "span" elements for additional IDs.  Note
            # that we cannot use empty "a" elements because there
            # may be targets inside of references, but nested "a"
            # elements aren't allowed in XHTML (even if they do
            # not all have a "href" attribute).
            if empty or isinstance(node,
                        (nodes.bullet_list, nodes.docinfo,
                         nodes.definition_list, nodes.enumerated_list,
                         nodes.field_list, nodes.option_list,
                         nodes.table)):
                # Insert target right in front of element.
                prefix.append('<span id="%s"></span>' % id)
            else:
                # Non-empty tag.  Place the auxiliary <span> tag
                # *inside* the element, as the first child.
                suffix += '<span id="%s"></span>' % id
    attlist = sorted(atts.items())
    parts = [tagname]
    for name, value in attlist:
        # value=None was used for boolean attributes without
        # value, but this isn't supported by XHTML.
        assert value is not None
        if isinstance(value, list):
            values = [unicode(v) for v in value]
            # the modified call to the `attval` function/method
            parts.append('%s="%s"' % (name.lower(),
                                      attval(self, ' '.join(values))))
        else:
            # the modified call to the `attval` function/method
            parts.append('%s="%s"' % (name.lower(),
                                      attval(self, unicode(value))))
    if empty:
        infix = ' /'
    else:
        infix = ''
    return ''.join(prefix) + '<%s%s>' % (' '.join(parts), infix) + suffix


def attval(self, text):
    """
    Cleanse, HTML encode, and return attribute value text.

    Ported from https://docutils.sourceforge.io/docutils/writers/_html_base.py
    and tweaked to preserve *whitespaces* -- such as *newline* characters --
    in the content of HTML attributes.
    (Needed for `source-text-start` and `source-text-end' attributes of the
    swish code boxes, which contain raw Prolog code.)
    """
    encoded = self.encode(text)
    if self.in_mailto and self.settings.cloak_email_addresses:
        # Cloak at-signs ("%40") and periods with HTML entities.
        encoded = encoded.replace('%40', '&#37;&#52;&#48;')
        encoded = encoded.replace('.', '&#46;')
    return encoded


def depart_swish_code_node(self, node):
    """Builds a closing HTML tag for Simply Logical swish **code** boxes."""
    self.depart_literal_block(node)


def visit_swish_code_node_(self, node):
    """
    Builds a prefix for embedding Simply Logical swish **code** boxes in LaTeX
    and raw text.
    """
    raise NotImplemented


def depart_swish_code_node_(self, node):
    """
    Builds a postfix for embedding Simply Logical swish **code** boxes in LaTeX
    and raw text.
    """
    raise NotImplemented


def file_exists(file_path):
    """Checks whether a path exists and is a file."""
    if os.path.exists(file_path):
        if not os.path.isfile(file_path):
            raise RuntimeError('The code file ({}) is not a '
                               'file.'.format(file_path))
    else:
        raise RuntimeError('The code file ({}) does not '
                           'exist.'.format(file_path))


def strip_exercise_block(text):
    """
    Strips the *examples* block of text from the input text::
       file content
       file content
       ...
       /** <examples>
       content that will be stripped
       content that will be stripped
       ...
       content that will be stripped
       */
    resulting in::
       file content
       file content
       ...
    """
    rgx = '\s*^/\*\*\s*<examples>\s*$.*?(?!^\*/\s*$).*?^\*/\s*$\s*'
    pattern = re.compile(rgx, flags=(re.M | re.I | re.S))

    no_examples = pattern.sub('\n', text).strip()
    return no_examples


class SWISH(Directive):
    """
    Defines the `swish` directive for building Simply Logical swish boxes with
    code.
    The `swish` directive is of the form::
       .. swish:: 1.2.3 (required)
          :inherit-id: 4.1.1[, xxx, xxx] (optional)
          :source-text-start: 4.1.1-start (optional)
          :source-text-end: 4.1.1-end (optional)

    All of the ids need to be Prolog code files **without the** `.pl`
    **extension**, located in a single directory. The directory is provided to
    Sphinx via the `sl_code_directory` config setting and is **required**.

    Optionally, the `sl_swish_url` config setting can be provided, which
    specifies the URL of the execution swish server. If one is not given,
    the default URL hardcoded in the swish JavaScript library will be used
    (i.e., `https://swish.simply-logical.space/`).

    This directive operates on three Sphinx environmental variables:

    sl_swish_code
      A dictionary encoding the association between code files and documents.
      See the description of the `memorise_code` method for more details.

    sl_has_swish
      A set of names of documents that include swish boxes.

    sl_swish_inherited
      A dictionary of code ids that are being inherited by swish boxes.
      The value for each code id is a set of documents that included the
      inheritance.

    This Sphinx extension monitors the code files for changes and
    regenerates the content pages that use them if a change is detected.
    """
    required_arguments = 1
    optional_arguments = 0
    final_argument_whitespace = False
    has_content = False
    option_spec = {'inherit-id': directives.unchanged,
                   'source-text-start': directives.unchanged,
                   'source-text-end': directives.unchanged}

    def run(self):
        """Builds a swish box."""
        # NOTE: using `env.note_dependency()` may simplify monitoring for code
        #       file changes.
        env = self.state.document.settings.env
        options = self.options

        # memorise that this document (a content source file) uses at least
        # one swish box
        if not hasattr(env, 'sl_has_swish'):
            env.sl_has_swish = set()
        if env.docname not in env.sl_has_swish:
            env.sl_has_swish.add(env.docname)

        # retrieve the path to the directory holding the code files
        sl_code_directory = env.config.sl_code_directory
        if sl_code_directory is None:
            raise RuntimeError('The sl_code_directory sphinx config value '
                               'must be set.')
        # localise the directory if given as an absolute path
        if sl_code_directory.startswith('/'):
            localised_directory = '.' + sl_code_directory
        else:
            localised_directory = sl_code_directory
        # check whether the directory exists
        if not os.path.exists(localised_directory):
            raise RuntimeError('The sl_code_directory ({}) does not '
                               'exist.'.format(localised_directory))

        # get the code file name for this particular swish box
        code_filename = self.arguments[0]
        # add the .pl extension as it should be missing
        if not code_filename.endswith('.pl'):
            code_filename_id = code_filename
            code_filename += '.pl'
        else:
            code_filename_id = code_filename[:-3]

        # compose the full path to the code file and ensure it exists
        path_localised = os.path.join(localised_directory, code_filename)
        # path_original = os.path.join(sl_code_directory, code_filename)
        file_exists(path_localised)

        # memorise the association between the document (a content source
        # file) and the code box -- this is used for watching for code file
        # updates
        self.memorise_code(code_filename_id, path_localised,
                           is_main_codeblock=True)

        # process the options -- they are used as HTML attributes
        attributes = {}
        # extract `inherit-id` (which may contain multiple ids) and memorise it
        inherit_id = options.get('inherit-id', None)
        if inherit_id is not None:
            for iid in inherit_id.split(' '):
                iid = iid.strip()
                if iid.endswith('.pl'):
                    raise RuntimeError('The *inherit-id* parameter of a swish '
                                       'box should not use .pl extension.')
                inherit_id_filename = iid + '.pl'
                inherit_id_path = os.path.join(localised_directory,
                                               inherit_id_filename)
                file_exists(inherit_id_path)
                # memorise the association between the document and code box
                # NOTE: this may note necasarily be needed as the inherit code
                # is not read directly into the document from the code file
                self.memorise_code(iid, inherit_id_path)
                # memorise that this code id will be inherited
                if not hasattr(env, 'sl_swish_inherited'):
                    env.sl_swish_inherited = dict()
                if iid in env.sl_swish_inherited:
                    env.sl_swish_inherited[iid].add(env.docname)
                else:
                    env.sl_swish_inherited[iid] = {env.docname}
            attributes['inherit_id'] = inherit_id
        # extract `source-text-start` and memorise it
        source_start = options.get('source-text-start', None)
        if source_start is not None:
            if not source_start.endswith('.pl'):
                source_start += '.pl'
            source_start_path = os.path.join(localised_directory, source_start)
            file_exists(source_start_path)
            # memorise the association between the document and code box
            self.memorise_code(source_start, source_start_path)
            with open(source_start_path, 'r') as f:
                contents = f.read()
            # clean out the examples section
            raw_content = strip_exercise_block(contents)
            attributes['source_text_start'] = '{}\n\n'.format(raw_content)
        # extract `source-text-end` and memorise it
        source_end = options.get('source-text-end', None)
        if source_end is not None:
            if not source_end.endswith('.pl'):
                source_end += '.pl'
            source_end_path = os.path.join(localised_directory, source_end)
            file_exists(source_end_path)
            # memorise the association between the document and code box
            self.memorise_code(source_end, source_end_path)
            with open(source_end_path, 'r') as f:
                contents = f.read()
            # clean out the examples section
            raw_content = strip_exercise_block(contents)
            attributes['source_text_end'] = '\n{}'.format(raw_content)

        # read in the code file and create a swish **code** node
        with open(path_localised, 'r') as f:
            contents = f.read()
        pre = swish_code(contents.strip(), contents,
                         ids=['swish.{}'.format(code_filename_id)],
                         **attributes)

        # create the outer swish node
        box = swish_box(ids=[code_filename_id])

        # insert the swish code node into the outer node
        box += pre

        return [box]

    def memorise_code(self, code_filename_id, path_localised,
                      is_main_codeblock=False):
        """
        Memorises the association between the current document (a content
        source file containing the instantiation of the `swish` directive
        encoded by this object) and the code box. This procedure is also
        applied to *inherited files* as well as *linked sources*
        (`source-text-start` and `source-text-end`) in addition to the code box
        itself.
        All of this information is stored in the `sl_swish_code` Sphinx
        environmental variable, which has the following structure::
            {'code_id': {'docs': set(docnames),
                         'main_doc': the_main_document_using_this_code_block,
                         'path': file_path_to_code_id,
                         'signature': creation_time_of_file_path_to_code_id},
             ...
            }
        Memorising this information allows to watch for changes in the code
        files and force Sphinx to rebuild pages that include swish boxes that
        depend upon them.
        """
        env = self.state.document.settings.env

        if not hasattr(env, 'sl_swish_code'):
            env.sl_swish_code = {}

        # if code id has already been seen, verify that the code file has not
        # changed and add the document name to the watchlist for this code file
        if code_filename_id in env.sl_swish_code:
            # verify signature
            if (os.path.getmtime(path_localised)
                    != env.sl_swish_code[code_filename_id]['signature']):
                raise RuntimeError('A code file signature has changed during '
                                   'the runtime.')
            # add the document name to the set of dependent files
            env.sl_swish_code[code_filename_id]['docs'].add(env.docname)

            # check if this docname is the main one using this codeblock
            if is_main_codeblock:
                if env.sl_swish_code[code_filename_id]['main_doc'] is None:
                    env.sl_swish_code[code_filename_id]['main_doc'] = (
                        env.docname)
                else:
                    raise RuntimeError(
                        ('Only one code block can be created from each source '
                         'file. The code id {} is used by {} and cannot be '
                         'used by {}.').format(
                             code_filename_id,
                             env.sl_swish_code[code_filename_id]['main_doc'],
                             env.docname)
                    )
        # if code id has not been seen, create a new item storing its details
        else:
            env.sl_swish_code[code_filename_id] = {
                'docs': {env.docname},
                'main_doc': env.docname if is_main_codeblock else None,
                'path': path_localised,
                'signature': os.path.getmtime(path_localised)
            }


def purge_swish_detect(app, env, docname):
    """
    Cleans the information stored in the Sphinx environment about documents
    with swish blocks (`sl_has_swish`), inherited ids (`sl_swish_inherited`)
    and the links between documents and swish code sources (`sl_swish_code`).
    If a document gets regenerated, the information whether this document
    has a swish directive is removed before the document is processed again.
    Similarly, links from code files to this document are purged.

    This function is hooked up to the `env-purge-doc` Sphinx event.
    """
    if hasattr(env, 'sl_has_swish'):
        # if the document was recorded to have a swish block and is now being
        # rebuilt, remove it from the store
        if docname in env.sl_has_swish:
            env.sl_has_swish.remove(docname)

    if hasattr(env, 'sl_swish_inherited'):
        nodes_to_remove = set()
        for inherit_id, docname_set in env.sl_swish_inherited.items():
            if docname in docname_set:
                docs_no = len(docname_set)
                if docs_no > 1:
                    docname_set.remove(docname)
                elif docs_no == 1:
                    docname_set.remove(docname)
                    nodes_to_remove.add(inherit_id)
                else:
                    assert inherit_id in nodes_to_remove
        for i in nodes_to_remove:
            del env.sl_swish_inherited[i]

    if hasattr(env, 'sl_swish_code'):
        nodes_to_remove = set()
        for code_id, code_node in env.sl_swish_code.items():
            # if the document was linked to any source code file and is now
            # being rebuilt, remove it from the appropriate stores
            if docname in code_node['docs']:
                docs_no = len(code_node['docs'])
                if docs_no > 1:
                    code_node['docs'].remove(docname)
                elif docs_no == 1:
                    code_node['docs'].remove(docname)
                    nodes_to_remove.add(code_id)
                else:
                    assert code_id in nodes_to_remove
            if docname == code_node['main_doc']:
                code_node['main_doc'] = None
        for i in nodes_to_remove:
            del env.sl_swish_code[i]


def merge_swish_detect(app, env, docnames, other):
    """
    In case documents are processed in parallel, the data stored in
    `sl_has_swish`, `sl_swish_inherited` and `sl_swish_code` Sphinx environment
    variables from different threads need to merged.

    This function is hooked up to the `env-merge-info` Sphinx event.
    """
    if not hasattr(env, 'sl_has_swish'):
        env.sl_has_swish = set()
    if hasattr(other, 'sl_has_swish'):
        # join two sets by taking their union
        env.sl_has_swish |= other.sl_has_swish

    if not hasattr(env, 'sl_swish_inherited'):
        env.sl_swish_inherited = dict()
    if hasattr(other, 'sl_swish_inherited'):
        # join two sets by taking their union
        for key, val in other.sl_swish_inherited.items():
            if key in env.sl_swish_inherited:
                env.sl_swish_inherited[key] |= val
            else:
                env.sl_swish_inherited[key] = val

    if not hasattr(env, 'sl_swish_code'):
        env.sl_swish_code = {}
    if hasattr(other, 'sl_swish_code'):
        for key, val in other.sl_swish_code.items():
            # if this code file has already been referred to in another
            # document
            if key in env.sl_swish_code:
                # verify timestamp and path
                if ((env.sl_swish_code[key]['signature'] != val['signature'])
                        or (env.sl_swish_code[key]['path'] != val['path'])):
                    raise RuntimeError('A code file signature has changed '
                                       'during the runtime.')
                # join two sets by taking their union
                env.sl_swish_code[key]['docs'] |= val['docs']
                # choose the main document name
                if val['main_doc'] is not None:
                    if env.sl_swish_code[key]['main_doc'] is None:
                        env.sl_swish_code[key]['main_doc'] = val['main_doc']
                    else:
                        raise RuntimeError(
                            ('Two documents ({} and {}) are using the same '
                             'code file as a main source ().'
                             'file. The code id {} is used by {} and cannot be '
                             'used by {}.').format(
                                 val['main_doc'],
                                 env.sl_swish_code[key]['main_doc'],
                                 key)
                        )
            # if this code file has not yet been referred to
            else:
                # transfer the whole content
                env.sl_swish_code[key] = val


def inject_swish_detect(app, doctree, docname):
    """
    Injects call to the swish JavaScript library in documents that have swish
    code blocks.

    This function is hooked up to the `doctree-resolved` Sphinx event.
    """
    env = app.builder.env

    # if no swish code blocks were detected, skip this step
    if not hasattr(env, 'sl_has_swish'):
        return
    # if this document does not have any swish code blocks, skip this step
    if docname not in env.sl_has_swish:
        return

    # check for a user-specified SWISH server URL in the config
    sl_swish_url = env.config.sl_swish_url
    if sl_swish_url:
        call = 'swish:"{:s}"'.format(sl_swish_url)
    else:
        call = ''
    swish_function = ('\n\n    <script>$(function() {{ $(".swish").LPN('
                      '{{{}}}); }});</script>\n'.format(call))
    # `format='html'` is crucial to avoid escaping html characters
    script_node = nodes.raw(swish_function, swish_function, format='html')
    # add the call node to the document
    doctree.append(script_node)


def analyse_swish_code(app, env, added, changed, removed):
    """
    Ensures that when a code file is edited all the linked documents are
    updated.

    This function is hooked up to the `env-get-outdated` Sphinx event.
    """
    # skip this step if no swish code blocks were found
    if not hasattr(env, 'sl_swish_code'):
        return set()

    # check whether any code file has changed
    changed_code_files = set()
    for code_dict in env.sl_swish_code.values():
        # if the file still exists, check whether it has been updated
        if os.path.exists(code_dict['path']):
            file_signature = os.path.getmtime(code_dict['path'])
            if file_signature != code_dict['signature']:
                # check which files use this code file and add them to the list
                changed_code_files = changed_code_files.union(code_dict['docs'])
        # if the file has been removed, force a refresh of the affected docs
        else:
            changed_code_files = changed_code_files.union(code_dict['docs'])

    # disregard documents that are already marked to be updated or were
    # discarded
    changed_code_files -= removed | changed | added

    return changed_code_files


#### Extension setup ##########################################################


def setup(app):
    """
    Sets up the Sphinx extension for `infobox`, `exercise` and `swish`
    directives.
    """
    # register the two Sphinx config values used for the extension
    app.add_config_value('sl_code_directory', None, 'env')
    app.add_config_value('sl_swish_url', '', 'env')

    # register the custom docutils nodes with Sphinx
    app.add_node(
        infobox,
        html=(visit_infobox_node, depart_infobox_node),
        latex=(visit_infobox_node_, depart_infobox_node_),
        text=(visit_infobox_node_, depart_infobox_node_)
    )
    app.add_enumerable_node(
        exercise,
        'exercise',
        exercise_title_getter,
        html=(visit_exercise_node, depart_exercise_node),
        latex=(visit_exercise_node_, depart_exercise_node_),
        text=(visit_exercise_node_, depart_exercise_node_)
    )
    app.add_node(
        exercise_title,
        html=(visit_exercise_title_node, depart_exercise_title_node),
        latex=(visit_exercise_title_node_, depart_exercise_title_node_),
        text=(visit_exercise_title_node_, depart_exercise_title_node_)
    )
    app.add_node(
        swish_box,
        html=(visit_swish_box_node, depart_swish_box_node),
        latex=(visit_swish_box_node_, depart_swish_box_node_),
        text=(visit_swish_box_node_, depart_swish_box_node_)
    )
    app.add_node(
        swish_code,
        html=(visit_swish_code_node, depart_swish_code_node),
        latex=(visit_swish_code_node_, depart_swish_code_node_),
        text=(visit_swish_code_node_, depart_swish_code_node_)
    )

    # ensure the required auxiliary files are included in the Sphinx build
    if 'jupyter_book' not in app.config.extensions:
        # Jupyter Books takes care of it
        app.add_css_file('sl.css')
        app.add_css_file('lpn.css')
        app.add_js_file('lpn.js')
        app.add_css_file('jquery-ui.min.css')
        app.add_js_file('jquery-ui.min.js')

    # register the custom directives with Sphinx
    app.add_directive('infobox', Infobox)
    app.add_directive('swish', SWISH)
    app.add_directive('exercise', Exercise)

    # connect custom hooks to the Sphinx build process
    app.connect('env-purge-doc', purge_swish_detect)
    app.connect('env-merge-info', merge_swish_detect)
    app.connect('doctree-resolved', inject_swish_detect)
    app.connect('env-get-outdated', analyse_swish_code)
    app.connect('config-inited', set_exercise_numfig_format)

    return {'version': VERSION}
